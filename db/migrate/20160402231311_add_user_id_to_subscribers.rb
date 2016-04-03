class AddUserIdToSubscribers < ActiveRecord::Migration
  def change
  	add_reference :subscribers, :user, index: true
  end
end
