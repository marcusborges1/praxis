class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_monitors
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

  def set_monitors
    if current_user.sector == Sector.people_management_sector
      @monitors = User.sector_acessors(Sector.org_pres_sector)
    else
      @monitors = User.sector_acessors(Sector.people_management_sector)
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password, :sector_id, :password_confirmation,
                                   :monitor_id, :position_ids)
    end
end
