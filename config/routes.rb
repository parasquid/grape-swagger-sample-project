Rails.application.routes.draw do
  mount API::Root => '/api'
  mount GrapeSwaggerRails::Engine => '/api/docs'
end
