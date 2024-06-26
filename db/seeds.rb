# frozen_string_literal: true

require 'faker'

10.times do
  gross_salary = Faker::Number.number(digits: 4)
  salary_calcs = CalculateInssDiscountService.new(gross_salary:).calculate
  inss_discount = salary_calcs[:discount]
  net_salary = salary_calcs[:net_salary]

  Proponent.create(
    name: Faker::Name.name,
    cpf: Faker::Number.number(digits: 11),
    street_name: Faker::Address.street_name,
    house_number: Faker::Number.number(digits: 3),
    neighborhood: Faker::Address.community,
    city: Faker::Address.city,
    state: Faker::Address.state,
    phone_number: Faker::PhoneNumber.phone_number,
    gross_salary:,
    inss_discount:,
    net_salary:
  )
end

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
