class Task < ApplicationRecord
    belongs_to :category
    belongs_to :user
    validates :title, :category, :details, :date_due, presence:true

    after_initialize :set_default_status, unless: :persisted?

    private
  
    def set_default_status
      self.completed = false
    end
  end    
