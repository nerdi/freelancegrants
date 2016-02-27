class Contact < ActiveRecord::Base
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  validates :message, presence: true
  validates :poo_bear, absence: {message: "To have gotten here you must be a Terminator you cybernetic freak!"}
  validates_format_of :email, :with => /.+@.+\..+/i
end
