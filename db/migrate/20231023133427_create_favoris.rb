class CreateFavoris < ActiveRecord::Migration[7.0]
  def change
    create_table :favoris do |t|
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
