class EvaluationCyclesController < ApplicationController
  before_action :set_evaluation_cycle, only: [:show, :edit, :update, :destroy]

  def index
    @evaluation_cycles = EvaluationCycle.all
  end

  def show
  end

  def new
    @evaluation_cycle = EvaluationCycle.new
  end

  def edit
  end

  def create
    @evaluation_cycle = EvaluationCycle.new(evaluation_cycle_params)

    if @evaluation_cycle.save
      redirect_to @evaluation_cycle, notice: 'Evaluation cycle was successfully created.'
    else
      render :new
    end
  end

  def update
    if @evaluation_cycle.update(evaluation_cycle_params)
      redirect_to @evaluation_cycle, notice: 'Evaluation cycle was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @evaluation_cycle.destroy
    redirect_to evaluation_cycles_url, notice: 'Evaluation cycle was successfully destroyed.'
  end

  private
    def set_evaluation_cycle
      @evaluation_cycle = EvaluationCycle.find(params[:id])
    end

    def evaluation_cycle_params
      params.require(:evaluation_cycle).permit(:initial_date, :end_date)
    end
end