module API
  class Root < Grape::API
    format :json
    formatter :json, Grape::Formatter::Rabl
    # rescue_from :all

    before do
      header['Access-Control-Allow-Origin'] = '*'
      header['Access-Control-Request-Method'] = '*'
    end

    prefix 'api'
    mount API::V1::Root
    # mount API::V2::Root (next version)

    add_swagger_documentation mount_path: '/api_docs',
      api_version: 'v1'

  end
end