# frozen_string_literal: true

class CalculateInssDiscountService
  def initialize(params = {})
    @salary = params[:salary]
  end

  INSS_TABLE = {
    tracks: [
      { limit: 1412.0, aliquot: 0.075, deduction: 0.0 },
      { limit: 2666.68, aliquot: 0.09, deduction: 21.18 },
      { limit: 4000.03, aliquot: 0.12, deduction: 101.18 },
      { limit: 7786.02, aliquot: 0.14, deduction: 181.18 }
    ]
  }.freeze

  def calculate
    aliquot = INSS_TABLE[:tracks].find do |track|
      @salary <= track[:limit]
    end

    return 0 if @salary > INSS_TABLE[:tracks].last[:limit]

    ((@salary * aliquot[:aliquot]) - aliquot[:deduction]).round(2)
  end
end
