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
      salary: 1000
    )
    expect(proponent).to be_valid
  end
end
