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
    User.import(params[:file])
    redirect_to root_url, flash: "User data imported."
  end

end
