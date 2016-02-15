ActiveAdmin.register Post do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  permit_params :title, :body, :profile_image, :image
  controller do
    def show
        @post = Post.includes(versions: :item).find(params[:id])
        @versions = @post.versions
        @post = @post.versions[params[:version].to_i].reify if params[:version]
        show! #it seems to need this
    end
  end
  sidebar :versionate, :partial => "layouts/version", :only => :show

  sidebar "Details", only: :show do
    attributes_table_for post do
      v = post.versions.last
      h1 post.versions
      h2 v.event
      h3 v.created_at
      h3 v.whodunnit
      h3 v.created_at
      h3 v.previous.object
      h3 v.object
    end
  end
  show do
    h3 post.title
    div do
      simple_format post.body
    end
  end
  form do |f|
    inputs 'Details' do
      input :title
      input :body, :input_html => {:class => "redactor"}
      input :profile_image, :required => false, :as => :file, destroy: false, :direct => true
      input :image, :required => false, :as => :file, destroy: false, :direct => true
      actions
    end
  end
end
