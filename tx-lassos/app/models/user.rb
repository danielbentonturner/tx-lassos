class User < ActiveRecord::Base
	after_create :send_confirmation_notice_to_admin

  def self.pledge_class
    User.all.map {|u| u['pledge_class']}
  end

  def self.pledge_class_name
    User.all.map {|u| u['pledge_class_name']}
  end

  def self.grad_year
    User.all.map {|u| u['grad_year']}
  end

  def send_confirmation_notice_to_admin
    @admin = User.where(admin: true)
    @admin_emails = @admin.map { |x| x.email }
    @admin_emails.each { |x| UserMailer.signup_confirmation(x).deliver }
  end 

  def self.need_approval
    User.where(approved: false)
  end

  include Gravtastic
  gravtastic

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  # def send_welcome_message
  #   UserMailer.signup_confirmation(self).deliver
  # end
end


