class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
     belongs_to :topic
        belongs_to :summary
     
  default_scope { order('created_at DESC') }
end
