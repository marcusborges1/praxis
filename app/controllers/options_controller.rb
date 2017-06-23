class OptionsController < ApplicationController
  before_action :set_option, only: [:show, :edit, :update, :destroy]

  def index
    @options = Option.all
  end

  def show
  end

  def new
    @option = Option.new
  end

  def edit
  end

  def create
    @option = Option.new(option_params)

    if @option.save
      redirect_to @option, notice: 'Option was successfully created.'
    else
      render :new
    end
  end

  def update
    if @option.update(option_params)
      redirect_to @option, notice: 'Option was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @option.destroy
    redirect_to options_url, notice: 'Option was successfully destroyed.'
  end

  private
    def set_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:description, :question_id)
    end
end
