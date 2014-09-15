class Pending < ActiveRecord::Base

  def self.import(file)
    CSV.foreach(file, headers: true) do |row|
      Pending.create! row.to_hash
    end
  end

  def self.convert_pending_to_user(user_id)
    temp = User.where(id: user_id)
    new_user = temp.first
    new_user.approved = true
    pending_data = Pending.where(email: new_user.email)
    if pending_data.first
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

  def self.destroy_user(user_id)
    temp = User.where(id: user_id)
    removed_user = temp.first
    removed_user.destroy!
  end


  def self.pledge_class
   pledges = Pending.all.map {|u| u['pledge_class']}.compact
   pledges.reject! { |c| c.empty? }
   pledges.reject! {|x| x == " " }
   pledges.map(&:strip)
   pledges.uniq!
   pledges
  end

  def self.pledge_class_name
    p_names = Pending.all.map {|u| u['pledge_class_name']}.compact
    p_names.reject! { |c| c.empty? }
    p_names.reject! {|x| x == " " }
    p_names.map(&:strip)
    p_names.uniq!
    p_names
  end

  def self.grad_year
   grad = Pending.all.map {|u| u['grad_year']}.compact
   grad.reject! { |c| c.empty? }
   grad.reject! {|x| x == " " }
   grad.map(&:strip)
   grad.uniq!
   grad
  end

  def self.admin_edit
    render "admin_edit.html.erb"
  end
end
