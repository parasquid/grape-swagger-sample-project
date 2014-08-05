Rails.application.routes.draw do
  mount API::Root => '/'
  mount GrapeSwaggerRails::Engine => '/api/docs'
end
