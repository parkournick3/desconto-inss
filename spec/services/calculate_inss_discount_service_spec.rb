# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculateInssDiscountService, type: :model do
  describe '#calculate' do
    context 'when salary is 1000' do
      it 'returns 75' do
        service = described_class.new(salary: 1000)
        expect(service.calculate).to eq(75)
      end
    end

    context 'when salary is 2000' do
      it 'returns 180' do
        service = described_class.new(salary: 2000)
        expect(service.calculate).to eq(158.82)
      end
    end

    context 'when salary is 3000' do
      it 'returns 320' do
        service = described_class.new(salary: 3000)
        expect(service.calculate).to eq(258.82)
      end
    end

    context 'when salary is 4000' do
      it 'returns 480' do
        service = described_class.new(salary: 4000)
        expect(service.calculate).to eq(378.82)
      end
    end

    context 'when salary is 5000' do
      it 'returns 620' do
        service = described_class.new(salary: 5000)
        expect(service.calculate).to eq(518.82)
      end
    end

    context 'when salary is 10000' do
      it 'returns 0' do
        service = described_class.new(salary: 10_000)
        expect(service.calculate).to eq(0)
      end
    end
  end
end
