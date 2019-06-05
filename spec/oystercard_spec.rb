require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  it 'has a balance of zero' do
  expect(card.balance).to eq(0)
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'can top up the balance' do
      expect{ card.top_up 1 }.to change{ card.balance }.by 1
    end
  end
    it 'raises an error if the maximum balance is exceeded' do
      max_balance = Oystercard::MAX_BALANCE
      card.top_up(max_balance)
      expect{ card.top_up 1 }.to raise_error ("Maximum balance of #{max_balance} exceeded")
    end
  # This Test is no longer required:
  # describe '#deduct' do
  #   it 'takes an argument and deducts it from the balance' do
  #   card.top_up(45)
  #   expect(card.deduct(5)).to eq (40)
  #   end
  # end
  describe '#in_journey' do
    it 'is initially not in a journey' do
      expect(card.in_journey?).to be_falsey
    end
  end

  describe '#touch_in' do
    it 'does not allow touch in if balance is under £1' do
       expect { card.touch_in }.to raise_error "Your balance is below £1. Please top up"
    end

    it 'allows customer to touch in' do
      min_balance = Oystercard::MIN_BALANCE
      card.top_up(min_balance)
      card.touch_in
      expect(card).to be_in_journey
    end

    it 'reduces balance by minimum fair' do
      min_balance = Oystercard::MIN_BALANCE
      card.top_up(min_balance)
      card.touch_in
      expect { card.touch_out }.to change{card.balance}.by(-Oystercard::MIN_BALANCE)
    end
  end

  describe '#touch_out' do
    it 'allows customer to touch out' do
      card.touch_out
      expect(card).not_to be_in_journey
    end
  end
end
