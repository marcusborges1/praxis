module EvaluationReports
  def self.individual_report_data(evaluation)
    report_data = []

    answer_group = evaluation.answer_groups.take
    answer_group.answers.each do |answer|
      data = {}
      question_value = answer.question_value
      question = question_value.question
      evaluation_factor = question.evaluation_factor

      data[:evaluation_factor_name] = evaluation_factor.name
      data[:option_answered_weight] = answer.option.weight
      data[:question_weight] = question_value.value
      data[:score] = answer.option.weight * answer.question_value.value

      report_data << data
    end
    report_data
  end
end
