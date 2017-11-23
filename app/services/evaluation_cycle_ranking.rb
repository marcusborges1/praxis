module EvaluationCycleRanking
  def self.generate(_evaluation_cycle)
    ActiveRecord::Base.connection
                      .execute("select
                                    user_name,
                                    coalesce(round(sum(answer_average)::numeric, 2), 0.00) score
                                from
                                    (select
                                	u.id,
                                        u.name user_name,
                                        avg(opt.weight) answer_average
                                    from users u
                                    left join answer_groups ansg
                                        on ansg.evaluation_target_id = u.id
                                    left join answers ans
                                        on ans.answer_group_id = ansg.id
                                    left join options opt
                                        on ans.option_id = opt.id
                                    left join questions q
                                        on q.id = opt.question_id
                                    left join evaluation_factors ef
                                        on q.evaluation_factor_id = ef.id
                                    left join question_values qv
                                        on qv.question_id = q.id
                                    left join evaluations e
                                        on e.id = ansg.evaluation_id
                                    left join evaluation_cycles ec
                                        on ec.id = e.evaluation_cycle_id
                                    where ec.id = #{evaluation_cycle.id}
                                    group by u.id, ef.id, q.id) scores
                                group by scores.user_name
                                order by score desc;")
  end
end
