class HighlightsController < ApplicationController
  before_filter :require_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :authorize_user, only: [:new, :create, :edit, :update, :destroy]
  before_filter :find_user
  before_filter :find_highlight, only: [:edit, :update, :show, :destroy]
  
  def index
    @highlights = @user.highlights.all
  end
  
  def new
    @highlight = current_user.highlights.new()
  end
  
  def create
    @highlight = current_user.highlights.create(params[:highlight])
    if @highlight.save
      redirect_to user_highlight_url(@user,@highlight)
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @highlight.update_attributes(params[:highlight])
      redirect_to user_highlight_path(@user, @highlight)
    else
      render :edit
    end
  end
  
  def show
  end
  
  def destroy
    @highlight.destroy
  end
  
  private
  
    def authorize_user
      if cannot?
        flash[:error] = 'Not Authorized!'
        redirect_to root_url
      end
    end
    
    def require_user
      if !current_user
        flash[:error] = "You have to be signed in!"
        redirect_to root_url
      end
    end
  
    def cannot?
      current_user.id != params[:user_id].to_i
    end
    
    def find_highlight
      @highlight = @user.highlights.find(params[:id])
    end
    
    def find_user
      @user = User.find(params[:user_id])
    end
end
