class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :monitors]
  load_and_authorize_resource

  def index
    @users = User.includes(:sector).all
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
    authorize! :set, :monitors
    if @user.sector == Sector.people_management
      @users = User.where.not(sector: Sector.people_management)
    elsif @user.sector == Sector.organizational_presidency
      @users = User.where(sector: Sector.people_management)
    end
  end

  def add_monitors
    if params[:monitors]
      User.where(id: params[:monitors][:user_id]).each do |user_has_monitor|
        unless user_has_monitor.monitors.nil?
          user_has_monitor.monitors.push(@user) unless user_has_monitor.monitors.find(@user.id).nil?
        end
      end
      User.where.not(id: params[:monitors][:user_id]).each do |user|
        user.monitors.delete(@user)
      end
    end
    redirect_to users_url, notice: 'Acompanhantes definidos com sucesso.'
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :sector_id, :password_confirmation,
                                   :monitor_id, :position_ids, :monitors)
    end
end
