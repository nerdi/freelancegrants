require 'elasticsearch/model'
class Post < ActiveRecord::Base
  #add attachement declaration to models for refile image uploading
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  #index settings elasticsearch

  settings index: {
        number_of_shards: 1,
        analysis: {
           tokenizer: {
              ngram_tokenizer: {
                 type: "nGram",
                 min_gram: 4,
                 max_gram: 4
              }
           },
           analyzer: {
              ngram_tokenizer_analyzer: {
                 type: "custom",
                 tokenizer: "ngram_tokenizer"
              }
           }
        }
     } do
       mapping dynamic: true do
         indexes :title, analyzer: "ngram_tokenizer_analyzer"
         indexes :body, analyzer: "ngram_tokenizer_analyzer"
       end
     end

  #validation
  validates_presence_of :title, :body

  #attachment declarations
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
