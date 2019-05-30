class RemoveCommenterFromArticles < ActiveRecord::Migration[5.2]
  def change
    remove_column :articles, :commenter, type = nil
    add_reference :articles, :user, foreign_key: true
  end
end
