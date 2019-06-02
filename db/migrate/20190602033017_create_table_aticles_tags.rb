class CreateTableAticlesTags < ActiveRecord::Migration[5.2]
  def change
    create_table :table_aticles_tags do |t|
      t.references :article, foreign_key: true
      t.references :tag, foreign_key: true
    end
  end
end
