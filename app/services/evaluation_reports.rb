module EvaluationReports
  def self.individual_report_data(evaluation)
    report_data = []

    answer_group = evaluation.answer_groups.where(answered: true).take
    target_id = answer_group.evaluation_target_id
    answer_group.answers.each do |answer|
      data = {}
      question_value = answer.question_value
      question = question_value.question
      evaluation_factor = question.evaluation_factor

      data[:evaluation_factor_name] = evaluation_factor.name
      data[:answer_average] = EvaluationReports.evaluation_answer_average(evaluation, target_id, question.id)
      data[:question_weight] = question_value.value
      data[:answer_average_with_question_weight] = (data[:answer_average] * question_value.value).round(2)

      report_data << data
    end
    report_data
  end

  def self.evaluation_answer_average(evaluation, target_id, question_id)
    answer_ids = evaluation.answer_groups.where(answered: true,
                                             evaluation_target_id: target_id).map(&:answers).flatten.pluck(:id)

    options = Answer.find(answer_ids).map(&:option)
    question_responses = options.select { |option| option.question_id == question_id }
    average_responses = question_responses.inject(0) { |result, e| result += e.weight } / question_responses.length
    average_responses.round(2)
  end

  def self.evaluation_final_averages(evaluation_scores)
    answer_final_average = evaluation_scores.inject(0) { |result, e| result += e[:answer_average] }
    answer_final_average_with_weight = evaluation_scores.inject(0) { |result, e| result += e[:answer_average_with_question_weight] }
    number_of_evaluation_factors = evaluation_scores.length

    {
      average_without_weight: (answer_final_average/number_of_evaluation_factors).round(2),
      average_with_weight: (answer_final_average_with_weight/number_of_evaluation_factors).round(2)
    }
  end
end
