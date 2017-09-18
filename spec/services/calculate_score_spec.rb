require 'rails_helper'

RSpec.describe CalculateScore do
  before(:all) do
    sector = FactoryGirl.create(:sector)
    users = FactoryGirl.create_list(:user, 2, sector: sector)
    evaluation_model = FactoryGirl.create(:evaluation_model, sector: sector)
    evaluation_cycle = FactoryGirl.create(:evaluation_cycle)
    @evaluation_factor = FactoryGirl.create(:evaluation_factor)
    question_1 = FactoryGirl.create(:question, evaluation_factor: @evaluation_factor)
    question_2 = FactoryGirl.create(:question, evaluation_factor: @evaluation_factor)
    options_question_1 = FactoryGirl.create_list(:option, 2, question: question_1)
    options_question_2 = FactoryGirl.create_list(:option, 2, question: question_2)
    question_value_1 = FactoryGirl.create(:question_value, question: question_1, evaluation_model: evaluation_model)
    question_value_2 = FactoryGirl.create(:question_value, question: question_2, evaluation_model: evaluation_model)
    evaluation = FactoryGirl.create(:evaluation, evaluation_cycle: evaluation_cycle, evaluation_model: evaluation_model)
    evaluation.create_answer_group(reviewer_id: users.first.id, evaluation_target_id: users.second.id)
    @answer_group = evaluation.answer_groups.first
    @answer_group.answers.first.update(option: options_question_1.first)
    @answer_group.answers.second.update(option: options_question_2.second)
    @answer_group.update(answered: true) if @answer_group.finished?
  end

  context ".individual_score" do
    before(:each) do
      @calculated_score = CalculateScore.individual_score(@answer_group)
    end

    it "returns the score of answer_group factors" do
      score = 0
      @answer_group.answers.each { |answer| score += answer.option.weight*answer.question_value.value }
      expect(score).to eq(@calculated_score)
    end

    xit "calculates score only of said evaluation_factor" do
      evaluation_factor =  FactoryGirl.create(:evaluation_factor)
      @answer_group.answers.second.question.update(evaluation_factor: evaluation_factor)
      score = CalculateScore.individual_score_of_factor(@answer_group, @evaluation_factor)
      expect(score).not_to eq(@calculated_score)
    end
  end
end
