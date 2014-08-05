module API
  module V1
    class Root < API::Root
      version 'v1'
      format :json

      mount API::V1::Authors
      mount API::V1::Posts
    end
  end
end