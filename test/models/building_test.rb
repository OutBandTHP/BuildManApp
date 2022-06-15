require "test_helper"

class BuildingTest < ActiveSupport::TestCase

  def setup
    @project = Project.create(name: "Project", email: "project@example.com", address: "Address 1",
                           no_buildings: 1, no_units: 2)
    @building = Building.new(name: '1', address: @project.address, project_id: @project.id)
  end
  
  test "should be valid" do
    assert @building.valid?
  end

  test "name should be present" do
    @building.name = ""
    assert_not @building.valid?
  end

  test "project.id should be present" do
    @building.project_id = nil
    assert_not @building.valid?
  end
end
