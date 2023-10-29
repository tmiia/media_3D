class AddLastArticleReadDateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_article_read_date, :date
  end
end
