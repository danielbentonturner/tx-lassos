class Pending < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      Pending.create! row.to_hash
    end
  end

  def self.convert_pending_to_user(new_user)
    new_user.approved = true
    pending_data = Pending.where(email: new_user.email)
    if !pending_data.first
      new_user.street = pending_data.first.street_address
      new_user.city_state = pending_data.first.city_state
      new_user.phone = pending_data.first.phone
      new_user.email = pending_data.first.email
      new_user.email2 = pending_data.first.email2
      new_user.major = pending_data.first.major
      new_user.pledge_class = pending_data.first.pledge_class
      new_user.pledge_class_name = pending_data.first.pledge_class_name
      new_user.grad_year = pending_data.first.grad_year
      new_user.employer = pending_data.first.employer
      new_user.job_title = pending_data.first.job_title
      new_user.comments = pending_data.first.comments
    end
    new_user.save!
  end
end
