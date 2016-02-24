class Footer < ActiveRecord::Base
  #add attachement declaration to models for refile image uploading
  attachment :footer_image1
  attachment :footer_image2
  attachment :footer_image3
end
