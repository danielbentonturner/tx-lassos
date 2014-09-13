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
  end

  def view_profile
    @user = User.find(params[:user_id])
  end

  def show
    # binding.pry
    @user = User.find(params[:p_id])
    # unless @user == current_user
    #   redirect_to :back, :alert => "Access denied."
    # end
    render file: 'profile/index'
  end

  def update
    @user = User.find(params[:user_id])
    @user.update(user_params)

    @user.save!(:validate => false)
    redirect_to root_path
  end

  def find
    @users = User.all
    # find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    render 'user/find'
  end

  def edit
    @user = User.find_by(:id)
    respond_to {|format| format.html}
  end

  def send_confirmation_notice_to_admin
    @admin = User.where(admin: true)
    @admin_emails = @admin.map { |x| x.email }
    @admin_emails.each { |x| x.send_confirmation_instructions }
    flash.notice = "An administrator will approve your registration shortly."
  end 

  def select_admin
    if @user.admin?
      flash.alert = "This user is already an administrator."
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
  
end
