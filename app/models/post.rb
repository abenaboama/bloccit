class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  belongs_to :user
     belongs_to :topic
        belongs_to :summary

  def up_votes
     votes.where(value: 1).count
  end
     
  default_scope { order('created_at DESC') }

     validates :title, length: { minimum: 5 }, presence: true
     validates :body, length: { minimum: 20 }, presence: true
     #validates :topic, presence: true
     #validates :user, presence: true
end
