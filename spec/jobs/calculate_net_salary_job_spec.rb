# frozen_string_literal:true

require 'rails_helper'

RSpec.describe CalculateNetSalaryJob, type: :job do
  describe '#perform' do
    it 'enqueues CalculateNetSalaryJob' do
      ActiveJob::Base.queue_adapter = :test
      expect do
        CalculateNetSalaryJob.perform_later(1)
      end.to have_enqueued_job
    end
  end
end
