class RemoveColumnFromPost < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :content
    remove_column :comments, :comment
  end
end
