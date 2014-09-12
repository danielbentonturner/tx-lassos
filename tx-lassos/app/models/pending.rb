class Pending < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      Pending.create! row.to_hash
    end
  end

end
