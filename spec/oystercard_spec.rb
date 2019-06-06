require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  let(:entry_station){ double :station }
  let(:exit_station){ double :station }
  let(:journey){ {entry_station: entry_station, exit_station: exit_station} }

  let(:max_balance){Oystercard::MAX_BALANCE}
  let(:min_balance){Oystercard::MIN_BALANCE}

  context 'balance check & top up' do

    it 'has a balance of zero' do
      expect(card.balance).to eq(0)
    end

    it 'can top up the balance' do
      expect{ card.top_up 1 }.to change{ card.balance }.by 1
    end

    it 'raises an error if the maximum balance is exceeded' do
      card.top_up(max_balance)
      expect{ card.top_up 1 }.to raise_error ("Maximum balance of #{max_balance} exceeded")
    end
  end

  describe '#touch_in' do
    it 'does not allow touch in if balance is under £1' do
       expect { card.touch_in(entry_station) }.to raise_error "Your balance is below £1. Please top up"
    end

    context 'oystercard is in journey due to successful touch in' do

      before (:each) do
        card.top_up(min_balance)
        card.touch_in(entry_station)
      end

      it 'allows customer to touch in' do
        expect(card).to be_in_journey
      end

      it 'records the entry station' do
        expect(card.entry_station).to eq entry_station
      end
    end
  end

  describe '#touch_out' do

    it 'allows customer to touch out' do
      card.touch_out(exit_station)
      expect(card).not_to be_in_journey
    end

    it 'reduces balance by minimum fair' do
      card.top_up(min_balance)
      card.touch_in(entry_station)
      expect { card.touch_out(exit_station) }.to change{card.balance}.by(-Oystercard::MIN_BALANCE)
    end
  end

  describe 'record of journey' do

    it 'has an empty list of journeys by default' do
      expect(card.journeys).to be_empty
    end

    it 'stores a journey' do
      card.top_up(min_balance)
      card.touch_in(entry_station)
      card.touch_out(exit_station)
      card.record_journey
      expect(card.journeys).to include journey
    end
  end
end
