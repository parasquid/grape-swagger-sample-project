module API
  module V1
    class Authors < API::V1::Root
      resource :authors do
        desc 'Returns an author'
        params do
          requires :id, desc: 'Author ID', type: Integer
        end
        get ':id' do
          ::Author.find(params[:id])
        end

        desc "Return list of authors"
        get do
          Author.all
        end

        desc 'Creates an author'
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