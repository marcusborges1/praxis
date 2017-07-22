class PositionsController < ApplicationController
  before_action :set_position, only: [:show, :edit, :update, :destroy]
  
  def index
    @positions = Position.all.order(:name)
  end

  def show
  end

  def new
    @position = Position.new
  end

  def edit
  end

  def create
    @position = Position.new(position_params)
    if @position.save
      redirect_to @position, notice: 'Cargo foi criado com sucesso'
    else
      render :new
    end
  end

  def update
    if @position.update(position_params)
      redirect_to @position, notice: 'Cargo foi atualizado com sucesso'
    else
      render :edit
    end
  end

  def destroy
    @position.destroy
    redirect_to positions_url, notice: 'Cargo foi deletado com sucesso'
  end

  private
    def set_position
      @position = Position.find(params[:id])
    end

    def position_params
      params.require(:position).permit(:name, :context)
    end
end
