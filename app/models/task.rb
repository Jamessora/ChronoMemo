class Task < ApplicationRecord
    belongs_to :category
    belongs_to :user
    validates :title, :category, :details, :date_due, presence:true
end
