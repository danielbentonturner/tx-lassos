class UserController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @user = User.find(current_user.id)
    # puts USER!!!
    # puts ApplicationController.current_user
    # @current_user = ApplicationController.current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def show
    @user = User.find(:id)
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def update
    account_update_params = :account_update

    # if account_update_params[:password].blank?
    #   account_update_params.delete("password")
    #   account_update_params.delete("password_confirmation")
    # end

    @user = User.find(current_user.id)
    if @user.update_attributes(account_update_params)
      set_flash_message :notice, :updated
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render root_path
    end
  end

  def edit
  end



end
