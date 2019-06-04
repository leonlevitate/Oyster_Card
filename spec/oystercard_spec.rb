require 'oystercard'

describe Oystercard do
  subject { Oystercard.new }

  it 'has a balance of zero' do
  expect(subject.balance).to eq(0)
  end

describe '#top_up' do

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'raises an error if the maximum balance is exceeded' do
    max_balance = Oystercard::MAX_BALANCE
    subject.top_up max_balance
    expect{ subject.top_up 1 }.to raise_error ("Maximum balance of #{max_balance} exceeded")
  end
end
# In order to pay for my journey
# As a customer
# I need my fare deducted from my card
  describe '#deduct' do
    it 'takes an argument and deducts it from the balance' do
    subject.top_up(45)
    expect(subject.deduct(5)).to eq (40)
    end
  end

  it 'responds if the customer is in journey' do
    expect(subject.in_journey?).to be_falsey
  end

  it 'allows customer to touch in' do
    subject.top_up(2)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'allows customer to touch out' do
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it 'does not allow touch in without balance under £1' do
     expect { subject.touch_in }.to raise_error "Your balance is below £1. Please top up"
  end
end
