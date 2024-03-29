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

  after_create_commit :enqueue_calculate_net_salary_job
  after_save :enqueue_calculate_net_salary_job, if: lambda {
                                                      saved_change_to_inss_discount? || saved_change_to_gross_salary?
                                                    }

  def enqueue_calculate_net_salary_job
    CalculateNetSalaryJob.perform_later(id)
  end

  scope :ordered, -> { order('updated_at DESC') }
end
