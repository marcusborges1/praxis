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
      data[:answer_average] = EvaluationReports.evaluation_answer_average(evaluation, target_id)
      data[:question_weight] = question_value.value
      data[:answer_average_with_question_weight] = EvaluationReports.evaluation_answer_average(evaluation, target_id) * question_value.value

      report_data << data
    end
    report_data
  end

  def self.evaluation_answer_average(evaluation, target_id)
    # seleciona todos os grupos de respostas daquela avaliação
    answer_groups = evaluation.answer_groups.where(answered: true)
    right_answer_group_ids = answer_groups.where(evaluation_target_id: target_id).pluck(:id)
    # Pega as respostas de cada grupo de respostas
    answers = Answer.where(answer_group_id: right_answer_group_ids)
    options = answers.map(&:option)
    answer_weights = options.map(&:weight)
    answers_average = answer_weights.inject { |sum, e| sum += e } / answer_weights.length
    answers_average.round(2)
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
