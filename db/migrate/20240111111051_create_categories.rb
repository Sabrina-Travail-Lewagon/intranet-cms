class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.string :nom
      t.string :image
      t.string :background_color

      t.timestamps
    end
  end
end
