ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "varma.com",
  :user_name            => "puneethvarma29@gmail.com",
  :password             => "14324365",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"


#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
