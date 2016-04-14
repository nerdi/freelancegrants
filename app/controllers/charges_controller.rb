class ChargesController < ApplicationController
	def new
	end

	def create
		#Amount in cents
		@amount = 2500

		customer = Stripe::Customer.create(
			:email => "dan+testStripeCustomer@solocreative.com.au",
			:card => params[:stripeToken]
		)

		charge = Stripe::Charge.create(
			:customer => customer.id,
			:amount => @amount,
			:description => 'Test Description',
			:currency => 'aud'
		)
		stripe_token = params[:stripeToken]
		stripe_email = params[:stripeEoken]
		@purchase = Purchase.new(user_id:current_user.id, profile_id:2)
		redirect_to "http://www.dog.com", notice: 'Purchase was successfully created.'
		
		
	rescue Stripe::CardError => e
		flash[:alert] = e.message
		redirect_to profiles_path
	end
end
