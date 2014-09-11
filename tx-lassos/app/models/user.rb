class User < ActiveRecord::Base
  
  include Gravtastic
  gravtastic

  # def self.export(options = {})
  #   CSV.generate(options) do |csv|
  #     csv << column_names
  #     all.each do |item|
  #       csv << item.attributes.values_at(*column_names)
  #     end
  #   end
  # end

  # def self.approved
  #   where(approved: true)
  # end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      user = find_by_id(row["id"]) || new
      user.attributes = row.to_hash.slice(*accessible_attributes)
      user.save!
    end
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

end

