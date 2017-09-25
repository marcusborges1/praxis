class EvaluationFactorsController < ApplicationController
  before_action :set_evaluation_factor, only: [:show, :edit, :update, :destroy]

  # GET /evaluation_factors
  def index
    @evaluation_factors = EvaluationFactor.all
  end

  # GET /evaluation_factors/1
  def show
  end

  # GET /evaluation_factors/new
  def new
    @evaluation_factor = EvaluationFactor.new
  end

  # GET /evaluation_factors/1/edit
  def edit
  end

  # POST /evaluation_factors
  def create
    @evaluation_factor = EvaluationFactor.new(evaluation_factor_params)

    if @evaluation_factor.save
      redirect_to @evaluation_factor, notice: 'Evaluation factor was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /evaluation_factors/1
  def update
    if @evaluation_factor.update(evaluation_factor_params)
      redirect_to @evaluation_factor, notice: 'Evaluation factor was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /evaluation_factors/1
  def destroy
    @evaluation_factor.destroy
    redirect_to evaluation_factors_url, notice: 'Evaluation factor was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluation_factor
      @evaluation_factor = EvaluationFactor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluation_factor_params
      params.require(:evaluation_factor).permit(:name)
    end
end
