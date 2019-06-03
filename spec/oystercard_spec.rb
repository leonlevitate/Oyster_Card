require 'oystercard'

describe Oystercard do
  it 'has a balance of zero' do
  expect(subject.balance).to eq(0)
  end

#  In order to keep using public transport
#As a customer
#I want to add money to my card
describe '#top_up' do

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it 'can top up the balance' do
    oystercard = Oystercard.new
    expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
  end
  end
end
