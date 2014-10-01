class User < ActiveRecord::Base
	after_create :send_confirmation_notice_to_admin

  def self.pledge_class
    up_class = User.all.map {|u| u['pledge_class']}.compact
    up_class.reject! { |c| c.empty? }
    up_class.reject! {|x| x == " " }
    up_class.map(&:strip)
    up_class.uniq!
    up_class
  end

  def self.pledge_class_name
    up_name = User.all.map {|u| u['pledge_class_name']}.compact
    up_name.reject! { |c| c.empty? }
    up_name.reject! {|x| x == " " }
    up_name.map(&:strip)
    up_name.uniq!
    up_name
  end

  def self.grad_year
    u_grad = User.all.map {|u| u['grad_year']}.compact
    u_grad.reject! { |c| c.empty? }
    u_grad.reject! {|x| x == " " }
    u_grad.map(&:strip)
    u_grad.uniq!
    u_grad
  end

  def send_confirmation_notice_to_admin
    UserMailer.signup_confirmation('admin@lassoalumni.org').deliver
    # @admin = User.where(admin: true)
    # @admin_emails = @admin.map { |x| x.email }
    # @admin_emails.each { |x| UserMailer.signup_confirmation(x).deliver }
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

end


