class RemoveCommenterFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :commenter
    add_reference :comments, :user, foreign_key: true
  end
end
