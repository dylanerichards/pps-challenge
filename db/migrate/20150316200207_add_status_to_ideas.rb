class AddStatusToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :status, :string, default: "pending"
  end
end
