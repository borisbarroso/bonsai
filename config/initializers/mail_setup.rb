ActionMailer::Base.smtp_settings = {
  :address => "localhost",#"smtp.gmail.com",
  :port => "25",#"587",
  :domain => "ecuanime.net",
  #:user_name => "boris.barroso",
  #:password => "",
  :authentication => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
#Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
