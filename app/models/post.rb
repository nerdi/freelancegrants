require 'elasticsearch/model'
class Post < ActiveRecord::Base
  searchkick suggest: [:title]
  #add attachement declaration to moidels for refile image uploading
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  validates_presence_of :title, :body
  attachment :profile_image
  attachment :image
  def search_data
    as_json only: [:name, :body]
    {
      title: title,
      body: body
    }
  end
  def should_index? #should only index the following
    title
    body
  end
end
