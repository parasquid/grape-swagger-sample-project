module API
  module V1
    class Posts < API::V1::Root
      resource :posts do
        desc "Return list of recent posts"
        get do
          Post.recent.all
        end

        desc 'creates a post'
        params do
          optional :author_id, desc: 'the author ID (note: if the author ID does
            not exist, it will automatically create the author model and assign
            it a random name', type: Integer
          requires :post_title, desc: 'the post title'
          requires :post_body, desc: 'the post body'
        end
        post do
          author = ::Author.where({
            id: params[:author_id],
          }).first_or_create
          post = ::Post.create(
            author: author,
            title: params[:post_title],
            body: params[:post_body]
          )
          post
        end

      end
    end
  end
end