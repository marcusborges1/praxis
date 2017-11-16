class AnswerGroupsController < ApplicationController
  before_action :set_answer_group, unless: [:unanswered]
  load_and_authorize_resource

  def individual_report
    @user = User.find(@answer_group.evaluation_target_id)
    @evaluation = @answer_group.evaluation
    @report = EvaluationReports.individual_report_data(@evaluation, params[:evaluation_target_id])
    @final_sums = EvaluationReports.evaluation_final_sums(@report)
    render pdf: "individual_report", layout: "pdf-reports.html.erb"
  end

  def show
  end

  def edit
    @answer_group.evaluation_comment ||= EvaluationComment.new
    evaluation = Evaluation.find(@answer_group.evaluation_id)
    @question_values = QuestionValue.where(evaluation_model_id: evaluation.evaluation_model_id)
  end

  def unanswered
    @answer_groups = current_user.answer_groups.where(answered: false)
  end

  def update
    if @answer_group.update(answer_group_params)
      if @answer_group.finished?
        @answer_group.update(answered: true)
        redirect_to unanswered_path, notice: 'Avaliação finalizada com sucesso'
      else
        redirect_to unanswered_path, notice: 'Avaliação atualizada com sucesso'
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
    params.require(:answer_group).permit(:answered, :evaluation_id, :user_id,
                                         answers_attributes: [:id, :question_value_id, :option_id],
                                         evaluation_comment_attributes: [:id, :comment])
  end
end
