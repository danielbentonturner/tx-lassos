class Pending < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      Pending.create! row.to_hash
    end
  end

  def convert_pending_to_user(new_user)
    new_user.approval = true
    pending_data = Pending.where(email: new_user.email)
    new_user

  end

end
