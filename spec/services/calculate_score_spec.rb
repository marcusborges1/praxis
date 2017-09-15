require 'rails_helper'

RSpec.describe CalculateScore do
  before(:all) {
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
  }

  it "has answered answer_group" do
    expect(@answer_group.answered).to eq(true)
  end

  context "calculate score of single answer_group" do
    before(:each) { @report = CalculateScore.individual_score(@answer_group) }

    it "returns name of person's score" do
      expect(@report[:name]).to eq(@answer_group.evaluation_target.name)
    end

    it "calculates score of answer_group factors" do
      score = 0
      @answer_group.answers.each { |answer| score += answer.option.weight*answer.question_value.value }
      expect(@report[:score]).to eq(score)
    end

    it "calculates score only of said evaluation_factor" do
      evaluation_factor =  FactoryGirl.create(:evaluation_factor)
      @answer_group.answers.second.question.update(evaluation_factor: evaluation_factor)
      report = CalculateScore.individual_score_of_factor(@answer_group, @evaluation_factor)
      expect(report[:score]).not_to eq(@report[:score])
    end
  end
end
