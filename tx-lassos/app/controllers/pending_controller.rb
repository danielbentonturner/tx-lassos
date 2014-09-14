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

  def approve_user
    Pending.convert_pending_to_user(params['id'])
    index
  end

end

