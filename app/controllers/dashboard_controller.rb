# frozen_string_literal: true

class DashboardController < ApplicationController
  def index # rubocop:disable Metrics/MethodLength
    @proponents_by_salary_range = Proponent.proponents_count_by_salary_range

    @chart_type = 'bar'

    @chart_data = {
      labels: @proponents_by_salary_range.keys,
      datasets: [
        {
          label: 'Quantidade de proponentes',
          data: @proponents_by_salary_range.values,
          backgroundColor: [
            'rgba(255, 99, 132, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(255, 206, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)'
          ],
          borderColor: [
            'rgba(255, 99, 132, 1)',
            'rgba(54, 162, 235, 1)',
            'rgba(255, 206, 86, 1)',
            'rgba(75, 192, 192, 1)'
          ],
          borderWidth: 1
        }
      ]
    }

    @chart_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  end
end
