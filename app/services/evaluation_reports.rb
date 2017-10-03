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
    answer_weights.inject { |sum, e| sum += e } / answer_weights.length
  end
end
