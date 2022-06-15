class Building < ApplicationRecord
  belongs_to :project
  
  validates :name, presence: true, length: { maximum: 25 }
  validates :project_id, presence: true
end
