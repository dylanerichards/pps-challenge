class AddUpvotesToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :upvotes, :integer, default: 0
  end
end
