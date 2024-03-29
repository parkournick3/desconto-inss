# frozen_string_literal: true

require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ProponentsHelper. For example:
#
# describe ProponentsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ProponentsHelper, type: :helper do
  it 'returns address' do
    proponent = Proponent.new(
      street_name: 'Main Street',
      house_number: 123,
      neighborhood: 'Downtown',
      city: 'Metropolis',
      state: 'NY'
    )
    expect(helper.proponent_address(proponent)).to eq('Downtown Main Street, 123, Metropolis - NY')
  end
end
