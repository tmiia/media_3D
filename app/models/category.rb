class Category < ApplicationRecord
    has_many :articles
    has_many :debates

    # def self.existing_categories
    #     pluck(:label)
    # end

    def self.ransackable_attributes(auth_object = nil)
      ["id", "label"]
    end
    def self.ransackable_associations(auth_object = nil)
      ["article"]
    end
end
