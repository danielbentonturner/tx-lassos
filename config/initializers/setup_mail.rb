ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address               =>  'smtpout.secureserver.net',
  :port                  =>  '80',
  :authentication        =>  :plain,
  :user_name             =>  ENV['EMAIL'],
  :password              =>  ENV['PASSWORD'],
  :domain                =>  'lassoalumni.org',
  :enable_starttls_auto  =>  true
}