Rails.application.configure do
	if Rails.env.production?
	  config.action_mailer.smtp_settings = {
	    :address   => "smtp.sparkpostmail.com",
	    :port      => 587,
	    :enable_starttls_auto => true,
	    :user_name => ENV["SPARKPOST_USERNAME"],
	    :password  => ENV["SPARKPOST_API_KEY"],
	    :authentication => 'login',
	    :domain => 'freelancegrants.com.au'
	  }
  elsif Rails.env.development?
  	config.action_mailer.smtp_settings = {
	    :address   => "smtp.sparkpostmail.com",
	    :port      => 587,
	    :enable_starttls_auto => true,
	    :user_name => API_KEYS["SPARKPOST_USERNAME"],
	    :password  => API_KEYS["SPARKPOST_API_KEY"],
	    :authentication => 'login',
	    :domain => 'solocreative.com.au'
	  }
  end
end