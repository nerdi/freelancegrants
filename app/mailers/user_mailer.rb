class UserMailer < ApplicationMailer
	if Rails.env.production?
		default from: "dan@freelancegrants.com.au"
	else
		default from: "dan@solocreative.com.au" #change this to freelance grants in prod
	end
 
  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "Welcome to Freelance Grants!")
  end
end
