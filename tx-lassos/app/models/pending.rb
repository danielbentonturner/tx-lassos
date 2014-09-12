class Pending < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      pending_user = find_by_id(row["id"]) || new
      pending_user.attributes = row.to_hash.slice(*accessible_attributes)
      pending_user.save
    end
  end

end
