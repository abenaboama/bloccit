class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
     belongs_to :topic
        belongs_to :summary
     
  default_scope { order('created_at DESC') }

     validates :title, length: { minimum: 5 }, presence: true
     validates :body, length: { minimum: 20 }, presence: true
     validates :topic, presence: true
     validates :user, presence: true
end

renderer = Redcarpet::Render::HTML.new
extensions = {fenced_code_blocks: true}
redcarpet = Redcarpet::Markdown.new(renderer, extensions)
 

def markdown_title
	(@redcarpet.render title.to_s).html_safe
end

def markdown_body
	(@redcarpet.render body.to_s).html_safe
end