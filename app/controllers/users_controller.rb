class UsersController < ApplicationController
  before_filter :find_user, only: [:edit, :update, :show, :destroy]
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to user_url(@user)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      redirect_to user_url(@user)
    else
      render :edit
    end
  end
  
  def show
    @highlights = @user.highlights.all
  end
  
  def destroy
    @user.destroy
  end
  private
    def find_user
      @user = User.find(params[:id])
    end
end
