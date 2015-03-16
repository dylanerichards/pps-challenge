class AddOfficeToIdea < ActiveRecord::Migration
  def change
    add_column :ideas, :office, :string
  end
end
