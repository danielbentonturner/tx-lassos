class User < ActiveRecord::Base
  
  include Gravtastic
  gravtastic

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

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end

