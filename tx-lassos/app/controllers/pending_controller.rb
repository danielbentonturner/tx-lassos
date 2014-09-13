class PendingController < ApplicationController

  def show
    @pending = Pending.new
    @pending_all = Pending.all
  end

  def accept_pending
    @approval_list = Pending.need_approval?
  end

  def index
  end

  def export_lassos
    @users = User.all
    respond_to do |format|
      format.xls
      format.xlsx
    end
  end

  def import_lassos
    Pending.import(params[:file].tempfile.path)
    redirect_to root_path, flash.notice => "Spreadsheet imported."
  end

  def send_confirmation_notice_to_admin
    @admin = User.where(admin: true)
  	@admin_emails = @admin.map { |x| x.email }
  	@admin_emails.each { |x| x.send_confirmation_instructions }
        flash.notice = "Admin will approve your registration shortly"
  end
end

