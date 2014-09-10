class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    # puts USER!!!
    # puts ApplicationController.current_user
    # @current_user = ApplicationController.current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

end

