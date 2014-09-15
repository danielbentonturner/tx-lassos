class PendingController < ApplicationController

  def index
    approval_list
    render 'admin.html.erb'
  end

  def export
    @users = User.all
    respond_to do |format|
      format.html
      format.xls
      format.xlsx
    end
  end

  def import
    Pending.import(params[:file].tempfile.path)
    redirect_to root_path, :notice => "Spreadsheet imported."
  end

  def show
    @pending = Pending.new
    @pending_all = Pending.all
  end

  def approval_list
    @approval_list = User.need_approval
  end

  def handle_user
    if params['destroy']
      Pending.destroy_user(params['destroy'])
    else
      Pending.convert_pending_to_user(params['id'])
    end
    index
  end

  def admin_edit
    @users = User.all
    @user = User.find(params['edit_user'])
    @pending = Pending.all
    @pledge_class = Pending.pledge_class
    @pledge_class_name = Pending.pledge_class_name
    @grad_year = User.grad_year
    @edit_user = Pending.admin_edit(params['edit_user'])
    render "admin_edit.html.erb"
  end

end

