# frozen_string_literal: true

require 'inss_table'

class Proponent < ApplicationRecord
  include InssTable

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

  scope :ordered, -> { order('updated_at DESC') }

  def enqueue_calculate_net_salary_job
    CalculateNetSalaryJob.perform_later(id)
  end

  def salary_range
    current_track = INSS_TABLE[:tracks].find do |track|
      gross_salary <= track[:limit]
    end

    if current_track.present?
      if current_track[:limit] == INSS_TABLE[:tracks].first[:limit]
        "até R$ #{current_track[:limit]}"
      else
        "de R$ #{INSS_TABLE[:tracks][INSS_TABLE[:tracks].index(current_track) - 1][:limit]} até R$ #{current_track[:limit]}" # rubocop:disable Layout/LineLength
      end
    else
      "mais de R$ #{INSS_TABLE[:tracks].last[:limit]}"
    end
  end

  def self.proponents_count_by_salary_range
    Proponent.all
             .group_by(&:salary_range)
             .transform_values(&:count)
             .sort
             .to_h
  end
end
