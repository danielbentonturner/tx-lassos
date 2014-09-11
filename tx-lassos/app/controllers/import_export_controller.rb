class ImportExportController < ApplicationController

  def export_lassos
    @users = User.all
    respond_to do |format|
      format.xls
      format.xlsx
    end
  end

  def import_lassos
    Importer.import(params[:file])
    redirect_to root_url, flash: "Spreadsheet imported."
  end

end
