class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:individual_report, :show, :edit, :update, :destroy]
  load_and_authorize_resource

  def individual_report
    @answer_group = @evaluation.answer_groups.take
    @user = User.find(@answer_group.evaluation_target_id)
    @report = EvaluationReports.individual_report_data(@evaluation)
    render pdf: "individual_report", layout: "pdf-reports.html.erb"
  end

  def index
    @evaluations = Evaluation.all
  end

  def show
    @answer_groups = @evaluation.answer_groups.order(:user_id)
  end

  def new
    @evaluation = Evaluation.new
  end

  def edit
  end

  def create
    @evaluation = Evaluation.new(evaluation_params)
    if @evaluation.save
      @evaluation.create_answer_groups
      redirect_to @evaluation, notice: "Avaliação criada com sucesso"
    else
      render :new
    end
  end

  def update
    if @evaluation.update(evaluation_params)
      redirect_to @evaluation, notice: "Avaliação atualizada com sucesso"
    else
      render :edit
    end
  end

  def destroy
    @evaluation.destroy
    redirect_to evaluations_url, notice: "Avaliação destruída com sucesso"
  end

  private
  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  def target_params
    params.require(:evaluation).permit(:evaluation_target_id, :reviewer_id)
  end

  def evaluation_params
    params.require(:evaluation).permit(:name, :start_date, :finish_date, :evaluation_model_id,
                                       :evaluation_cycle_id)
  end
end
