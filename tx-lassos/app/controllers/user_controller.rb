class UserController < ApplicationController
  before_filter :authenticate_user!
  
  # def initializezzz
    # put into admin approved section
      # @users = User.find(1)
      # if @users.approved? && @users.confirmed?
      #   User.find(1).send_confirmation_instructions
      # else
      #   flash.now[:alert] = "Admin will approve your registration shortly"
      # end
  # end

  def index
    @users = User.all
    @user = User.find(current_user.id)

    # puts USER!!!
    # puts ApplicationController.current_user
    # @current_user = ApplicationController.current_user
    # @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def show
    @user = User.find_by(:id)
    unless @user == current_user
      redirect_to :back, :alert => "Access denied."
    end
  end

  def update
    # before_filter :configure_permitted_parameters, if: :devise_controller?
    # @user = User.find_by(:id)
    @user = User.find(params[:user_id])

    # params.each do |p|
    #   @user.p = params[:user][p]
    # end
    # params[:user][:phone] ? @user.phone = params[:user][:phone] : @user.phone = @user.phone
    # params[:user][:comments] ? @user.comments = params[:user][:comments] : @user.comments = @user.comments

    # @user.comments = params[:user][:comments]
    @user.update(user_params)

    @user.save!(:validate => false)
    # @user.
    # @user = User.find_by(params[:id])
    # account_update_params = :account_update

    # if account_update_params[:password].blank?
    #   account_update_params.delete("password")
    #   account_update_params.delete("password_confirmation")
    # end

    # @user = User.find(current_user.id)
    # puts " ************************************"
    # puts secure_params
    # puts " ************************************"
    # puts user_params

    # if @user.update_attributes(secure_params)
    #   set_flash_message :notice, :updated
    #   sign_in @user, :bypass => true
    #   redirect_to root_path
    # else
    #   redirect_to root_path
    # end
    redirect_to root_path
  end

  def edit
    @user = User.find_by(:id)
    respond_to {|format| format.html}
  end

  def send_confirmation_notice
    # put into admin approved section
      @users = User.find(:id)
      if @users.approved? 
        User.find(:id).send_confirmation_instructions
      else
        flash.now[:alert] = "Admin will approve your registration shortly"
      end
  end

  def select_admin
    if @user.admin?
      flash.now[:alert] = "this user is already an admin"
    else
      @user.save!(:admin => true)
    end
  end

  protected

  def user_params
    params.require(:user).permit(:name, :email, :email2, :street, :city_state, :phone, :email, :marital_status, :major, :pledge_class, :pledge_class_name, :grad_year, :employer, :job_title, :facebook, :twitter, :instagram, :linkedin, :pinterest, :comments)
  end

  # def comment_params

  # devise_parameter_sanitizer.for(:account_update) do |u|
  #       u.permit(:name, :email, :email2, :street, :city, :state, :zip_code, :phone, :email, :marital_status, :major, :pledge_class, :pledge_class_name, :grad_year, :employer, :job_title, :facebook, :twitter, :instagram, :linkedin, :pinterest, :comments)
  #     end

  # puts "!!!!!!!!!!"
  # puts params
  # @user = User.find_by(params[:user_id])
  # @user.comments = params[:profile[:comments]]
  # @user.save

  # @user = User.find_by(params[:user_id])

  # puts "XXXXX!!!!!!!!!!XXXX"
  # puts params[:profile][:comments]
  # @user.comments = params[:profile][:comments]
  # @user.save
  
end
