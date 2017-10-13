class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :monitors]
  load_and_authorize_resource

  def index
    @users = User.includes(:sector).all.order(:name)
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'Usuário foi excluído com sucesso.'
  end

  def monitors
    if @user.sector == Sector.people_management
      @users = User.where.not(sector: Sector.people_management).order(:name)
    else
      @users = User.where(sector: Sector.people_management).order(:name)
    end
  end

  def add_monitors
    if monitor_params
      User.where(id: monitor_params[:user_id]).update_all(monitor_id: @user.id)
      User.where.not(id: monitor_params[:user_id]).map{ |user| user.update(monitor_id: nil) if user.monitor == @user }
      redirect_to users_url, notice: 'Acompanhantes definidos com sucesso.'
    else
      @user.errors.add(:base, :invalid, message: "Erro ao atualizar monitores: não pode ser vazio")
      redirect_to monitors_url, notice: 'Não foi possivel realizar a operação: acompanhados não pode ser vazio'
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def monitor_params
      params.require(:monitors).permit(user_id: []) if params.key?('monitors')
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :sector_id, :password_confirmation,
                                   :monitor_id, :position_ids)
    end
end
