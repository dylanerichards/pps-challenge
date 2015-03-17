class Idea < ActiveRecord::Base
  default_scope -> { order("upvotes DESC") }
  validates_presence_of :title
  validates_presence_of :body

  belongs_to :category
  belongs_to :user

  def upvote
    self.upvotes += 1
  end
end
