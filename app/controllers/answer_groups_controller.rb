class AnswerGroupsController < ApplicationController
  before_action :set_answer_group, only: [:show, :edit, :update, :destroy]

  # GET /answer_groups
  def index
    @answer_groups = AnswerGroup.all
  end

  # GET /answer_groups/1
  def show
  end

  # GET /answer_groups/new
  def new
    @answer_group = AnswerGroup.new
  end

  # GET /answer_groups/1/edit
  def edit
  end

  # POST /answer_groups
  def create
    @answer_group = AnswerGroup.new(answer_group_params)
    if @answer_group.save
      redirect_to @answer_group, notice: 'Answer group was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /answer_groups/1
  def update
    if @answer_group.update(answer_group_params)
      redirect_to @answer_group, notice: 'Answer group was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /answer_groups/1
  def destroy
    @answer_group.destroy
    redirect_to answer_groups_url, notice: 'Answer group was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_answer_group
    @answer_group = AnswerGroup.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def answer_group_params
    params.require(:answer_group).permit(:evaluation_id, :user_id)
  end
end
