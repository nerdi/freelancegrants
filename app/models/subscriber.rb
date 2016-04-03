class Subscriber < ActiveRecord::Base
	has_many :interests
  has_many :categories, through: :interests
  belongs_to :user
  accepts_nested_attributes_for :categories

  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates :poo_bear, absence: {message: "To have gotten here you must be a Terminator you cybernetic freak!"}
  validates_format_of :email, :with => /.+@.+\..+/i
 
  after_create :subscribe_user_to_mailing_list
  after_create :send_welcome_email_to_user
 
  private
 
    def subscribe_user_to_mailing_list
      SubscribeUserToMailingListJob.set(wait: 1.minute).perform_later(self)
    end
    def send_welcome_email_to_user
      UserMailer.welcome_email(self).deliver_later!(wait: 2.minutes)
    end
end
