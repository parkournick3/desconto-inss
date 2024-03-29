# frozen_string_literal: true

class DashboardController < ApplicationController
  def index
    @proponents_by_salary_range = Proponent.proponents_count_by_salary_range
  end
end
