class EvaluationFactorsController < ApplicationController
  before_action :set_evaluation_factor, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @evaluation_factors = EvaluationFactor.all
  end

  def show; end

  def new
    @evaluation_factor = EvaluationFactor.new
  end

  def edit; end

  def create
    @evaluation_factor = EvaluationFactor.new(evaluation_factor_params)

    if @evaluation_factor.save
      redirect_to @evaluation_factor, notice: 'Evaluation factor was successfully created.'
    else
      render :new
    end
  end

  def update
    if @evaluation_factor.update(evaluation_factor_params)
      redirect_to @evaluation_factor, notice: 'Evaluation factor was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @evaluation_factor.destroy
    redirect_to evaluation_factors_url, notice: 'Evaluation factor was successfully destroyed.'
  end

  private

  def set_evaluation_factor
    @evaluation_factor = EvaluationFactor.find(params[:id])
  end

  def evaluation_factor_params
    params.require(:evaluation_factor).permit(:name)
  end
end
