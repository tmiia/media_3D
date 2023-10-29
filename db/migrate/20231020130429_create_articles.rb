class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :lead
      t.string :thumbnail
      t.text :text_content
      t.string :media
      t.integer :mood_value
      t.text :keywords
      t.boolean :is_longformat
      t.boolean :is_draft

      t.timestamps
    end
  end
end
