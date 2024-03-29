class QuestionsController < ApplicationController
  before_action :set_question, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show; end

  def new
    @question = Question.new
    4.times { @question.options.build }
  end

  def edit; end

  def create
    @question = Question.new(question_params)

    if @question.save
      redirect_to @question, notice: 'Questão criada com sucesso.'
    else
      render :new
    end
  end

  def update
    if @question.update(question_params)
      redirect_to @question, notice: 'Questão atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_url, notice: 'Questão foi excluída com sucesso.'
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:evaluation_factor_id, :description,
                                     options_attributes: %i[id description weight _destroy])
  end
end
