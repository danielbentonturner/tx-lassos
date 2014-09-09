class ImportExportController < ApplicationController

  def index
    @posts = Post.order(:created_at)
    
    respond_to do |format|
      format.html
      format.csv { send_data @posts.export }
    end
  end

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      Users.create! row.to_hash
    end
  end

  def self.export
    CSV.generate do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

end
