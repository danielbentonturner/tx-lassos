class ImportExportController < ApplicationController

  def files
    @users = User.all
    
    respond_to do |format|
      format.html
      format.csv { send_data @users.export}
    end
  end

end
