# frozen_string_literal: true

require 'inss_table'

class CalculateInssDiscountService
  include InssTable

  def initialize(params = {})
    @gross_salary = params[:gross_salary]
  end

  def calculate
    aliquot = INSS_TABLE[:tracks].find do |track|
      @gross_salary <= track[:limit]
    end

    return { discount: 0, net_salary: @gross_salary } unless aliquot

    discount = ((@gross_salary * aliquot[:aliquot]) - aliquot[:deduction]).round(2)
    net_salary = (@gross_salary - discount).round(2)

    { discount:, net_salary: }
  end
end
