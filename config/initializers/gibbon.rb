if Rails.env.production?
	Gibbon::Request.api_key = ENV["MAILCHIMP_API_KEY"]
else
	Gibbon::Request.api_key = API_KEYS["MAILCHIMP_API_KEY"]
end
Gibbon::Request.timeout = 15
Gibbon::Request.throws_exceptions = true