module CalculateScore
  def self.individual_score(answer_group)
    score = 0
    answer_group.answers.each do |answer|
      score += answer.option.weight * answer.question_value.value
    end
    score
  end

  def self.individual_score_of_factor(answer_group, evaluation_factor)
    score = 0
    answer_group.answers.each do |answer|
      score += answer.option.weight*answer.question_value.value if answer.evaluation_factor == evaluation_factor
    end
    { name: answer_group.evaluation_target.name, score: score }
  end
end
