class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :poll

  def self.user_already_voted?(user, poll)
    self.exists?(user: user, poll: poll)
  end
end
