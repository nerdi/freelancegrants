require 'elasticsearch/model'
class Post < ActiveRecord::Base
  #add attachement declaration to moidels for refile image uploading
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  validates_presence_of :title, :body
  attachment :profile_image
  attachment :image
  Post.import
end
