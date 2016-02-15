class Post < ActiveRecord::Base
  #add attachement declaration to moidels for refile image uploading
  has_paper_trail
  validates_presence_of :title, :body
  attachment :profile_image
  attachment :image
  include Rails.application.routes.url_helpers # neeeded for _path helpers to work in models
  def admin_permalink
    admin_post_path(self)
  end
end
