class AddMetaDescriptionToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :meta_description, :string
  end
end
