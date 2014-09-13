class Pending < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      Pending.create! row.to_hash
    end
  end

  def need_approval
    Pending.where(pending: true, approved: false)
  end

  def convert_pending_to_user(new_user)
    User.create!()
  end


end
