class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :instructions, presence: true
  validates :cook_time, numericality: { only_integer: true, greater_than: 0 }
  
  has_rich_text :instructions
  belongs_to :user
end
