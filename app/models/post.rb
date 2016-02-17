require 'elasticsearch/model'
class Post < ActiveRecord::Base
  #add attachement declaration to moidels for refile image uploading
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  validates_presence_of :title, :body
  attachment :profile_image
  attachment :image

  def as_json(defaults = nil)
    {
      :id => id,
      :title => title,
      :body => body
    }
  end

  def search(query)
    #__elasticsearch__.search({query: query})
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'body']
          }
        }
      }
    )
  end

end
