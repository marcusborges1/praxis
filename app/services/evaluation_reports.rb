module EvaluationReports
  def self.individual_report_data(evaluation, evaluation_target_id)
    keys = [:evaluation_factor_name, :answer_average, :question_weight, :answer_average_with_question_weight]

    AnswerGroup.joins(answers: { question_value: { question: [:options, :evaluation_factor] }})
               .where(answer_groups: { evaluation_id: evaluation.id, evaluation_target_id: evaluation_target_id, answered: true })
               .group("evaluation_factors.name, questions.description, question_values.id")
               .pluck("evaluation_factors.name,
                      round(cast(avg(options.weight) as numeric), 2),
                      question_values.value,
                      round(cast(avg(options.weight * question_values.value) as numeric), 2)")
               .map { |d| keys.zip(d).to_h }
  end

  def self.evaluation_final_sums(report_data)
    {
      average_without_weight: report_data.inject(0) { |result, e| result += e[:answer_average] },
      average_with_weight: report_data.inject(0) { |result, e| result += e[:answer_average_with_question_weight] }
    }
  end
end
