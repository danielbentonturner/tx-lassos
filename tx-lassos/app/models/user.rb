class User < ActiveRecord::Base
  
  include Gravtastic
  gravtastic

  def self.import(upload)
    Spreadsheet.client_encoding = 'UTF-8'
    book = upload['datafile'].original_filename
    directory = "public/data"
    
  end

  def self.export(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |item|
        csv << item.attributes.values_at(*column_names)
      end
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

