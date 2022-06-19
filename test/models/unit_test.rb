require "test_helper"

class UnitTest < ActiveSupport::TestCase

  def setup
    @project = projects(:one) #Project.create(name: "Project", email: "project@example.com", address: "Address 1",
    @secproj = projects(:two)                          #no_buildings: 1, no_units: 2)
    @building = buildings(:one)  #Building.create(name: '1', address: @project.address, project_id: @project.id)
    @secbld   = buildings(:two)
    @unit = Unit.new(unit_no: 1, project_id: @project.id, building_id: @building.id)
  end
  
  test "should be valid" do
    assert @unit.valid?
  end

  test "unit no. should be present" do
    @unit.unit_no = nil
    assert_not @unit.valid?
  end

  test "project.id should be present" do
    @unit.project_id = nil
    assert_not @unit.valid?
  end

  test "building should belong to project" do
    @unit.building_id = @secbld.id
    assert_not @unit.valid?
  end
end
