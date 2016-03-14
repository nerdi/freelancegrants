class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  #validates :message, presence: true
  validates :poo_bear, absence: {message: "To have gotten here you must be a Terminator you cybernetic freak!"}
  validates_format_of :email, :with => /.+@.+\..+/i
 
  after_create :subscribe_user_to_mailing_list
 
  private
 
  def subscribe_user_to_mailing_list
    SubscribeUserToMailingListJob.perform_later(self)
  end
end