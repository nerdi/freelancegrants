if Rails.env.production?
	Rails.configuration.stripe = {
	  :publishable_key => ENV["STRIPE_PUBLISHABLE_KEY"],
	  :secret_key      => ENV["STRIPE_SECRET_KEY"]
	}
	Stripe.api_key = Rails.configuration.stripe[:secret_key]
elsif Rails.env.development?
	Rails.configuration.stripe = {
	  :publishable_key => API_KEYS["STRIPE_PUBLISHABLE_KEY"],
	  :secret_key      => API_KEYS["STRIPE_SECRET_KEY"]
	}
	Stripe.api_key = Rails.configuration.stripe[:secret_key]
end