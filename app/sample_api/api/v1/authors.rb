module API
  module V1
    class Authors < Grape::API
      version 'v1'
      format :json

      resource :authors do
        desc "Return list of authors"
        get do
          Author.all
        end

        desc 'creates an author'
        params do
          requires :name, desc: 'the author\'s name'
        end
        post do
          author = ::Author.where({
            name: params[:name],
          }).first_or_create
          author
        end

      end
    end
  end
end