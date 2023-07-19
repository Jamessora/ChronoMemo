class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks
    validates :name, :details, presence: true
end
