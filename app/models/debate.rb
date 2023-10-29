class Debate < ApplicationRecord
    has_many :debate_responses

    has_one :poll
    belongs_to :category

    validates :title, presence: true
    validates :lead, presence: true, length: { maximum: 300 }
    validates :context, presence: true

    attribute :results_visible, :boolean
end
