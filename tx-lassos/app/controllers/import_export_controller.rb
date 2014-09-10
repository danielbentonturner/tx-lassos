class ImportExportController < ApplicationController

  def files
    @users = User.all
    
    respond_to do |format|
      format.html
      format.csv { send_data @users.export}
      format.xls
    end
  end

  def import
    User.import(params[:file])
    redirect_to SOMETHING, flash: "User data imported."
  end

end
