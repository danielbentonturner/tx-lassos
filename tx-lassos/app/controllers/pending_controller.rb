class PendingController < ApplicationController

  def index
    approval_list
    render 'admin.html.erb'
  end

  def export_users
    @users = User.all
    respond_to do |format|
      format.xls
      format.xlsx
    end
  end

  def import_users
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

  def approve_user(params)
    Pending.convert_pending_to_user(params[:user])
  end

end

