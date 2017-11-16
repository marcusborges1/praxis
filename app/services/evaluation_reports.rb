module EvaluationReports
  def self.individual_report_data(evaluation, evaluation_target_id)
    connection = ActiveRecord::Base.connection
    connection.execute("select
                          ef.name evaluation_factor_name,
                          round(cast(avg(op.weight) as numeric), 2) answer_average,
                          qv.value question_weight,
                          round(cast(avg(op.weight * qv.value) as numeric), 2) answer_average_with_question_weight
                        from answer_groups ansg
                        inner join answers ans
                          on ans.answer_group_id = ansg.id
                        inner join question_values qv
                          on qv.id = ans.question_value_id
                        inner join questions q
                          on q.id = qv.question_id
                        inner join options op
                          on op.id = ans.option_id
                        inner join evaluation_factors ef
                          on ef.id = q.evaluation_factor_id
                        where ansg.evaluation_id = #{connection.quote evaluation.id}
                          and ansg.evaluation_target_id = #{connection.quote evaluation_target_id}
                          and ansg.answered = true
                        group by ef.name, q.description, qv.id;")
  end

  def self.evaluation_final_sums(evaluation, evaluation_target_id)
    connection = ActiveRecord::Base.connection
    connection.select_one("select
                          	sum(report_data.answer_average) average_without_weight,
                          	sum(report_data.answer_average_with_question_weight) average_with_weight
                          from
                          (select
                            ef.name evaluation_factor_name,
                            round(cast(avg(op.weight) as numeric), 2) answer_average,
                            qv.value question_weight,
                            round(cast(avg(op.weight * qv.value) as numeric), 2) answer_average_with_question_weight
                          from answer_groups ansg
                          inner join answers ans
                            on ans.answer_group_id = ansg.id
                          inner join question_values qv
                            on qv.id = ans.question_value_id
                          inner join questions q
                            on q.id = qv.question_id
                          inner join options op
                            on op.id = ans.option_id
                          inner join evaluation_factors ef
                            on ef.id = q.evaluation_factor_id
                          where ansg.evaluation_id = #{connection.quote evaluation.id}
                            and ansg.evaluation_target_id = #{connection.quote evaluation_target_id}
                            and ansg.answered = true
                          group by ef.name, q.description, qv.id) report_data;")
  end
end
