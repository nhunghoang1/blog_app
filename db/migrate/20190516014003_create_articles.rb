class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.timestamps
    end
 
    create_table :articles do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.text :text

      t.timestamps
    end
  end
end
