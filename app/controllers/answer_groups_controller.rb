class AnswerGroupsController < ApplicationController
  before_action :set_answer_group

  def show
  end

  def edit
    evaluation = Evaluation.find(@answer_group.evaluation_id)
    @question_values = QuestionValue.where(evaluation_model_id: evaluation.evaluation_model_id)
  end

  def update
    if @answer_group.update(answer_group_params)
      if @answer_group.finished?
        @answer_group.update(answered: true)
        redirect_to @answer_group.evaluation, notice: 'Avaliação finalizada com sucesso'
      else
        redirect_to @answer_group.evaluation, notice: 'Avaliação atualizada com sucesso'
      end
    else
      render :edit
    end
  end

  private

  def set_answer_group
    @answer_group = AnswerGroup.find(params[:id])
  end

  def answer_group_params
    params.require(:answer_group).permit(:answered, :evaluation_id, :user_id, answers_attributes: [:id, :question_value_id, :option_id] )
  end
end
