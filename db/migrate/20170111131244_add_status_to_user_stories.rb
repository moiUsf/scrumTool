class AddStatusToUserStories < ActiveRecord::Migration[5.0]
  def change
    add_column :user_stories, :status, :string
  end
end
