class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.integer :images
      t.string :status
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :views_count
      t.integer :score
      t.string :pdf_filenames

      t.timestamps
    end
  end
end
