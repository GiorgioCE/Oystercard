require 'oystercard'

RSpec.describe Oystercard do

  describe 'balance' do
    it 'tells you the balance on your card' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'puts monies on the card' do
      expect(subject).to respond_to(:top_up).with(1).argument
    end

      it 'can top up the balance' do
      expect{subject.top_up 1}.to change { subject.balance }.by 1
    end

  it "top_up doesn't allow the card to exceed balance" do
    maximum_balance = Oystercard::MAXIMUM_BALANCE
    subject.top_up maximum_balance
      expect{ subject.top_up 1 }.to raise_error "Can't exceed #{maximum_balance}"
    end
  end
   # describe "#deduct" do
   #   it "deducts money from the card" do
   #     subject.top_up 20
   #     expect{subject.deduct 1}.to change { subject.balance}.by -1
   #   end
   # end
   describe "#in_journey?" do
     it "shows if we are in the middle of a journey" do
       @state = true
       expect(subject.in_journey?).to eq(nil)
     end
   end
   describe "#touch_in" do
     let(:station) {double :station}
     before(:each) do
       allow(station).to receive(:name).and_return("London")
     end
     it "tracks when you start a journey" do
       subject.top_up 10
       expect(subject.touch_in(station)).to eq("start")
     end
    it "checks it's the minimum balance" do
      minimum_balance = Oystercard::MINIMUM_BALANCE
      expect{subject.touch_in(station)}.to raise_error ("Insufficient funds #{minimum_balance}")
    end
    it 'remembers the entry station' do

      subject.top_up 20
      subject.touch_in(station)
      expect(subject.entry_station).to eq ("London")
    end
   end
   describe "#touch_out" do
     let(:station) {double :station}
     before(:each) do
       allow(station).to receive(:name).and_return("London")
     end
     it "tracks when you end a journey" do
       expect(subject.touch_out).to eq("end")
     end
     it "changes the balance when you touch out" do
      expect{subject.touch_out}.to change{subject.balance}.by -5
     end
     it 'resets the entry station' do
       subject.top_up 20
       subject.touch_in(station)
       subject.touch_out
      expect(subject.entry_station).to eq(nil)
     end
   end

end
