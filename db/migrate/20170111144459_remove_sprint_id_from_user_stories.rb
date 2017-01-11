class RemoveSprintIdFromUserStories < ActiveRecord::Migration[5.0]
  def change
    remove_column :user_stories, :sprint_id, :integer
  end
end
