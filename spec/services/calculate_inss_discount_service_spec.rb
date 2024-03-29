# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculateInssDiscountService, type: :model do
  describe '#calculate' do
    context 'when salary is 1000' do
      it 'returns 75' do
        service = described_class.new(gross_salary: 1000)
        expect(service.calculate).to eq({ discount: 75, net_salary: 925 })
      end
    end

    context 'when salary is 2000' do
      it 'returns 180' do
        service = described_class.new(gross_salary: 2000)
        expect(service.calculate).to eq({ discount: 158.82, net_salary: 1841.18 })
      end
    end

    context 'when salary is 3000' do
      it 'returns 320' do
        service = described_class.new(gross_salary: 3000)
        expect(service.calculate).to eq({ discount: 258.82, net_salary: 2741.18 })
      end
    end

    context 'when salary is 4000' do
      it 'returns 480' do
        service = described_class.new(gross_salary: 4000)
        expect(service.calculate).to eq({ discount: 378.82, net_salary: 3621.18 })
      end
    end

    context 'when salary is 5000' do
      it 'returns 620' do
        service = described_class.new(gross_salary: 5000)
        expect(service.calculate).to eq({ discount: 518.82, net_salary: 4481.18 })
      end
    end

    context 'when salary is 10000' do
      it 'returns 0' do
        service = described_class.new(gross_salary: 10_000)
        expect(service.calculate).to eq({ discount: 0, net_salary: 10_000 })
      end
    end
  end
end
