class ImportExportController < ApplicationController

  def export_lassos
    @users = User.all
    respond_to do |format|
      format.xls
      format.xlsx
    end
  end

  def import_lassos
    Pending.import(params[:file].tempfile.path)
    redirect_to root_path, flash: "Spreadsheet imported."
  end

  def import_spreadsheet
    render 'import_export.html.erb' 
  end

end
