class AdminController < ApplicationController

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
    redirect_to root_path, :alert => "Spreadsheet imported."
  end

end
