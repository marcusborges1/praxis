class EvaluationsController < ApplicationController
  before_action :set_evaluation, only: [:show, :edit, :update, :destroy]
  
  # GET /evaluations
  def index
    @evaluations = Evaluation.all
  end

  # GET /evaluations/1
  def show
  end

  # GET /evaluations/new
  def new
    @evaluation = Evaluation.new
  end

  # GET /evaluations/1/edit
  def edit
  end

  # POST /evaluations
  def create
    @evaluation = Evaluation.new(evaluation_params)

    if @evaluation.save
      redirect_to @evaluation, notice: 'Evaluation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /evaluations/1
  def update
    if @evaluation.update(evaluation_params)
      redirect_to @evaluation, notice: 'Evaluation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /evaluations/1
  def destroy
    @evaluation.destroy
    redirect_to evaluations_url, notice: 'Evaluation was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation
    @evaluation = Evaluation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def evaluation_params
    params.require(:evaluation).permit(:start_date, :finish_date, :evaluation_model_id)
  end
end
