# frozen_string_literal: true

module ApplicationHelper
  def inline_error_for(field, form_obj)
    html = []
    if form_obj.errors[field].any?
      html << form_obj.errors[field].map do |msg|
        tag.div(msg, class: '')
      end
    end
    html.join.html_safe
  end

  def proponent_address(proponent)
    "#{proponent.neighborhood} #{proponent.street_name}, #{proponent.house_number}, #{proponent.city} - #{proponent.state}" # rubocop:disable Layout/LineLength
  end
end
