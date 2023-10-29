class User < ApplicationRecord
  has_many :comments
  has_many :debate_responses
  has_many :reads
  has_many :votes

  has_many :favorites
  has_many :favorite_articles, through: :favorites, source: :article

  def update_consecutive_days
    if last_article_read_date && last_article_read_date == Date.today - 1
      self.consecutive_days += 1
    elsif last_article_read_date != Date.today
      self.consecutive_days = 1
    end

    self.last_article_read_date = Date.today
    save
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  private

  def last_read_date
    last_read&.created_at&.to_date
  end

  def last_read
    reads.order(created_at: :desc).first
  end

end
