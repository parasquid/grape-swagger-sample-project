class Post < ActiveRecord::Base
  belongs_to :author

  scope :recent, ->{ order('created_at DESC')}
end
