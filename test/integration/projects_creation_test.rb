require "test_helper"

class ProjectsCreationTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:userone)
  end

  test "buildings and units were created as needed" do
    log_in_as(@user)
    get new_project_path(locale: :en)
    assert_template 'projects/new'
    post projects_path, params: { project: { name:        "Project",
                                             email:       "project@example.com",
                                             address:      "Address of Project",
                                             no_buildings: 2,
                                             no_units:     4 } }

    follow_redirect!
    @project = Project.find_by(name: "Project")
    assert_equal 2, @project.buildings.count
    assert_equal 4, @project.units.count
  end
end
