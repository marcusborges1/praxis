class EvaluationModelsController < ApplicationController
  before_action :set_evaluation_model, only: [:show, :edit, :update, :destroy]

  # GET /evaluation_models
  def index
    @evaluation_models = EvaluationModel.all
  end

  # GET /evaluation_models/1
  def show
  end

  # GET /evaluation_models/new
  def new
    @evaluation_model = EvaluationModel.new
    2.times { @evaluation_model.question_values.build }
  end

  # GET /evaluation_models/1/edit
  def edit
  end

  # POST /evaluation_models
  def create
    @evaluation_model = EvaluationModel.new(evaluation_model_params)
    byebug
    if @evaluation_model.save
      redirect_to @evaluation_model, notice: 'Modelo de Avalição criado com sucesso'
    else
      render :new
    end
  end

  # PATCH/PUT /evaluation_models/1
  def update
    if @evaluation_model.update(evaluation_model_params)
      redirect_to @evaluation_model, notice: 'Modelo de Avaliação atualizado com sucesso'
    else
      render :edit
    end
  end

  # DELETE /evaluation_models/1
  def destroy
    @evaluation_model.destroy
    redirect_to evaluation_models_url, notice: 'Modelo de Avaliação destruído com sucesso'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_evaluation_model
    @evaluation_model = EvaluationModel.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def evaluation_model_params
    params.require(:evaluation_model).permit(:name, :sector_id, question_values_attributes: [ :id, :value, :question_id, :_destroy ] )
  end
end
