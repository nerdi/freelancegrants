class UserMailer < ApplicationMailer
	default from: "dan@freelancegrants.com.au" #change this to freelance grants in prod
 
  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(to: @subscriber.email, subject: "Welcome to Freelance Grants!")
  end
end
