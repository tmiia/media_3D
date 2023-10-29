class CreateDebateResponses < ActiveRecord::Migration[7.0]
  def change
    create_table :debate_responses do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :debate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
