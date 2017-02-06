class AddFinishedAtToUserStories < ActiveRecord::Migration[5.0]
  def change
    add_column :user_stories, :finished_at, :datetime
  end
end
