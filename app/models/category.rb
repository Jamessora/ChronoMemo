class Category < ApplicationRecord
    belongs_to :user
    has_many :tasks, dependent: :destroy
    validates :name, :details, presence: true
end
