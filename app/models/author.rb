class Author < ActiveRecord::Base
  has_many :posts

  before_create { |record| record.name ||= Faker::Name.name }
end
