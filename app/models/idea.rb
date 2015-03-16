class Idea < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :body

  belongs_to :category
  belongs_to :user
end