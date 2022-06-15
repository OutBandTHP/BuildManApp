class Unit < ApplicationRecord
  belongs_to :project
  belongs_to :building
  
  validates :unit_no, presence: true
  validates :project_id, presence: true
  validate  :belongs_to_building
  
  private
    def belongs_to_building
      return if building_id == nil
      unless Building.find(building_id).project.id == self.project_id 
        errors.add(self.building_id.to_s, " - This building does't belong to the project")
      end
    end
end
