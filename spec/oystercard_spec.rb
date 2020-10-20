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
end
