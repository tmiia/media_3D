class AddLastArticleAccessDateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :last_article_access_date, :date
  end
end
