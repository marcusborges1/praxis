class SectorsController < ApplicationController
  before_action :set_sector, only: %i[show edit update destroy]
  load_and_authorize_resource

  def index
    @sectors = Sector.includes(:users).paginate(page: params[:page])
  end

  def show; end

  def new
    @sector = Sector.new
  end

  def edit; end

  def create
    @sector = Sector.new(sector_params)

    if @sector.save
      redirect_to @sector, notice: 'Diretoria criada com sucesso.'
    else
      render :new
    end
  end

  def update
    if @sector.update(sector_params)
      redirect_to @sector, notice: 'Diretoria atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @sector.destroy
    redirect_to sectors_url, notice: 'Diretoria foi excluída com sucesso.'
  end

  private

  def set_sector
    @sector = Sector.find(params[:id])
  end

  def sector_params
    params.require(:sector).permit(:name)
  end
end
