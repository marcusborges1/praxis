class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: %i[answer_groups individual_report show edit update destroy]
  load_and_authorize_resource

  def individual_report
    @answer_group = @evaluation.answer_groups.find_by(user_id: params[:user_id], evaluation_target_id: params[:evaluation_target_id])
    @evaluated_user = User.find(@answer_group.evaluation_target_id)
    @report = EvaluationReports.individual_report_data(@evaluation, params[:evaluation_target_id])
    @final_sums = EvaluationReports.evaluation_final_sums(@evaluation, params[:evaluation_target_id])
    render pdf: 'individual_report', layout: 'pdf-reports.html.erb'
  end

  def answer_groups
    @answer_groups = AnswerGroup.joins(:evaluation).where(evaluation_target_id: params[:user_id],
                                                          evaluation_id: @evaluation.id)
  end

  def index
    @evaluations = Evaluation.paginate(page: params[:page])
  end

  def show; end

  def new
    @evaluation = Evaluation.new
  end

  def edit; end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      @evaluation.create_answer_groups target_params[:evaluation_target_id]
      redirect_to @evaluation, notice: 'Avaliação criada com sucesso'
    else
      render :new
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to @evaluation, notice: 'Avaliação atualizada com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to evaluations_url, notice: 'Avaliação destruída com sucesso'
  end

  private

  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def target_params
    params.require(:evaluation).permit(:evaluation_target_id)
  end

  def evaluation_params
    params.require(:evaluation).permit(:name, :start_date, :finish_date, :evaluation_model_id,
                                       :evaluation_cycle_id, :individual)
  end
end
