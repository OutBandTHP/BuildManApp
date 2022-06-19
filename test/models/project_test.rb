require "test_helper"

class ProjectTest < ActiveSupport::TestCase

  def setup
    @project = Project.new(name: "Project", email: "project@example.com", address: "Address 1",
                           no_buildings: 1, no_units: 2)
  end
  
  test "should be valid" do
    assert @project.valid?
  end

  test "name should be present" do
    @project.name = ""
    assert_not @project.valid?
  end

  test "email should be present" do
    @project.email = "  "
    assert_not @project.valid?
  end

  test "name should not be too long" do
    @project.name = "a" * 26
    assert_not @project.valid?
  end

  test "email should not be too long" do
    @project.email = "a" * 244 + "@example.com"
    assert_not @project.valid?
  end

  test "address should not be too long" do
    @project.name = "a" * 256
    assert_not @project.valid?
  end

  test "valid number of building" do
    @project.no_buildings = 0
    assert_not @project.valid?
  end

  test "valid number of units" do
    @project.no_units = 0
    assert_not @project.valid?
    @project.no_units = @project.no_buildings
    assert_not @project.valid?
  end

  test "valid number of units for buildings" do
    @project.no_units = @project.no_buildings + 1
    assert @project.valid?
  end
end
