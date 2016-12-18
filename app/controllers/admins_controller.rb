class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  respond_to :html

  def index
    if session[:admin_id] != nil
      @police = Police.order(:name)
      respond_with(@police)
    else
      redirect_to root_url
    end
  end

  def show
    if session[:admin_id] != nil
      respond_with(@police)
    else
      redirect_to root_url
    end
  end

  def new
    @admin = Admin.new
    respond_with(@admin)
  end

  def edit
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.save
    respond_with(@admin)
  end

  def update
    @admin.update(admin_params)
    respond_with(@admin)
  end

  def destroy
    @admin.destroy
    respond_with(@admin)
  end

  private
    def set_admin
      @admin = Admin.find(params[:id])
    end

    def admin_params
      params.require(:admin).permit(:username, :password, :name, :email)
    end
end
