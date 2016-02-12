class Post < ActiveRecord::Base
  #add attachement declaration to moidels for refile image uploading
  attachment :profile_image
end
