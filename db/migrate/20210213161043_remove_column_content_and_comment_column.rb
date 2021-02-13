class RemoveColumnContentAndCommentColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :content, :text
    remove_column :comments, :comment, :text
  end
end
