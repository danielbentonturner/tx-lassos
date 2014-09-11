class ImportExportController < ApplicationController

  def export_lassos
    @users = User.all
    respond_to do |format|
      format.html
      format.csv { send_data @users.export}
      format.xls
    end
  end

  def import_lassos
    @imported_lassos = Importer.import(Lassos.xls)
  end

end
