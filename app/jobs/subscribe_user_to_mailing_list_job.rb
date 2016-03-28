class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(user)
	gb = Gibbon::Request.new
		if Rails.env.production?
			user_id = user.id
    	this_category_id = Interest.find_by_subscriber_id(user_id).category_id
    	interest_category_name = Category.find_by_id(this_category_id).category_name
    	gb.lists(ENV["MAILCHIMP_LIST_ID"]).members.create(body: {email_address: user.email, status: "subscribed", merge_fields: {FNAME: user.first_name, LNAME: user.last_name}})
    else
    	user_id = user.id
    	this_category_id = Interest.find_by_subscriber_id(user_id).category_id
    	interest_category_name = Category.find_by_id(this_category_id).category_name
    	gb.lists(API_KEYS["MAILCHIMP_LIST_ID"]).members.create(body: {email_address: user.email, status: "subscribed", merge_fields: {FNAME: user.first_name, LNAME: user.last_name, INTEREST: interest_category_name}})
    end
  end
end
