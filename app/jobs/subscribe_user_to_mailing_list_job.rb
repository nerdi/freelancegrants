class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(user)
	gb = Gibbon::Request.new
		if Rails.env.production?
    	gb.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(body: {email_address: user.email, status: "subscribed", merge_fields: {FNAME: user.first_name, LNAME: user.last_name}})
    else
    	gb.lists(API_KEYS["MAILCHIMP_LIST_ID"]).members.create(body: {email_address: user.email, status: "subscribed", merge_fields: {FNAME: user.first_name, LNAME: user.last_name}})
    end
  end
end
