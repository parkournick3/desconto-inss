# frozen_string_literal: true

class CalculateNetSalaryJob < ApplicationJob
  queue_as :default

  def perform(proponent_id)
    proponent = Proponent.find(proponent_id)
    net_salary = CalculateInssDiscountService.new(gross_salary: proponent.gross_salary).calculate[:net_salary]
    proponent.update(net_salary:)
  end
end
