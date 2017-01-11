class AddSprintnumberToUserStories < ActiveRecord::Migration[5.0]
  def change
    add_column :user_stories, :sprintnumber, :string
  end
end
