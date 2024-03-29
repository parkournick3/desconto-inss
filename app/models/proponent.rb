# frozen_string_literal: true

class Proponent < ApplicationRecord
  validates :name, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :street_name, presence: true
  validates :house_number, presence: true
  validates :neighborhood, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :phone_number, presence: true
  validates :gross_salary, presence: true

  scope :ordered, -> { order(:name) }
end
