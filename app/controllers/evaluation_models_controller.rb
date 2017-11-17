class EvaluationModelsController < ApplicationController
  before_action :set_evaluation_model, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @evaluation_models = EvaluationModel.paginate(page: params[:page])
  end

  def show; end

  def new
    @evaluation_model = EvaluationModel.new
    2.times { @evaluation_model.question_values.build }
  end

  def edit; end

  def create
    @evaluation_model = EvaluationModel.new(evaluation_model_params)
    if @evaluation_model.save
      redirect_to @evaluation_model, notice: 'Modelo de Avalição criado com sucesso'
    else
      render :new
    end
  end

  def update
    if @evaluation_model.update(evaluation_model_params)
      redirect_to @evaluation_model, notice: 'Modelo de Avaliação atualizado com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @evaluation_model.destroy
    redirect_to evaluation_models_url, notice: 'Modelo de Avaliação destruído com sucesso'
  end

  private

  def set_evaluation_model
    @evaluation_model = EvaluationModel.find(params[:id])
  end

  def evaluation_model_params
    params.require(:evaluation_model).permit(:name, :sector_id, :project_id, :context,
                                             question_values_attributes: %i[id value question_id _destroy])
  end
end
