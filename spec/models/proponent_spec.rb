# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Proponent, type: :model do
  it 'is valid with valid attributes' do
    proponent = Proponent.new(
      name: 'John Doe',
      cpf: '12345678901',
      street_name: 'Main Street',
      house_number: 123,
      neighborhood: 'Downtown',
      city: 'Metropolis',
      state: 'NY',
      phone_number: '123456789',
      gross_salary: 1000
    )
    expect(proponent).to be_valid
  end

  it 'updates the proponent' do
    proponent = Proponent.create(
      name: 'John Doe',
      cpf: '12345678901',
      street_name: 'Main Street',
      house_number: 123,
      neighborhood: 'Downtown',
      city: 'Metropolis',
      state: 'NY',
      phone_number: '123456789',
      gross_salary: 1000
    )
    proponent.update(name: 'Jane Doe')
    expect(proponent.name).to eq('Jane Doe')
  end

  it 'deletes the proponent' do
    proponent = Proponent.create(
      name: 'John Doe',
      cpf: '12345678901',
      street_name: 'Main Street',
      house_number: 123,
      neighborhood: 'Downtown',
      city: 'Metropolis',
      state: 'NY',
      phone_number: '123456789',
      gross_salary: 1000
    )
    proponent.destroy
    expect(Proponent.count).to eq(0)
  end

  describe '#salary_range' do
    it 'returns the salary range 1000' do
      proponent = Proponent.new(gross_salary: 1000)
      # 1412.0
      expect(proponent.salary_range).to eq('até R$ 1412.0')
    end

    it 'returns the salary range 4005' do
      proponent = Proponent.new(gross_salary: 4005)
      expect(proponent.salary_range).to eq('de R$ 4000.03 até R$ 7786.02')
    end

    it 'returns the salary range 10_000' do
      proponent = Proponent.new(gross_salary: 10_000)
      expect(proponent.salary_range).to eq('mais de R$ 7786.02')
    end
  end
end
