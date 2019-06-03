require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
  expect(subject.balance).to eq(0)
  end

describe '#top_up' do

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    oystercard = Oystercard.new
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end

  it 'raises an error if the maximum balance is exceeded' do
    max_balance = Oystercard::MAX_BALANCE
    subject.top_up(max_balance)
    expect{ subject.top_up 1 }.to raise_error 'Maximum balance of 20 exceeded'
  end
end
end
