class EvaluationDecorator < ApplicationDecorator
  def value_colored
    case value
    when 4..5
      span_class = 'text-success'
    when 3
      span_class = 'text-warning'
    else
      span_class = 'text-danger'
    end

    helpers.content_tag :span, value, class: span_class
  end
end
