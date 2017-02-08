class AddAcceptedAndReviewcommentToUserStories < ActiveRecord::Migration[5.0]
  def change
    add_column :user_stories, :accepted, :boolean
    add_column :user_stories, :reviewcomment, :text
  end
end
