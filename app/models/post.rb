class Post < ActiveRecord::Base
  #add attachement declaration to moidels for refile image uploading
  validates_presence_of :title, :body
  attachment :profile_image
  attachment :image
end
