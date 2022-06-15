class ProjectsController < ApplicationController
  
  def index
    @projects = Project.paginate(page: params[:page], per_page: 5)
  end

  def show
    @project = Project.find(params[:id])
    set_project(@project)                   # TEMP
  end

  def new
    @project = Project.new
  end

  
  def create
    ActiveRecord::Base.transaction do
      @project = Project.new(project_params)
      if @project.save
#       message = define_admin_user
        Range.new(1, @project.no_buildings).each do |num| 
          Building.create(name: num, address: @project.address, project_id: @project.id)
        end
        bld = @project.buildings.first.id
        Range.new(1, @project.no_units).each do |num| 
          Unit.create(unit_no: num, project_id: @project.id, building_id: bld)
        end
        set_project(@project) 
        flash[:success] = "#{@project.name} was successfully created. " 
        redirect_to root_path
      else
        render 'new'
      end
    end
  end
  
  def edit
    @project = Project.find params[:id]
    set_project(@project)                   # TEMP
    store_location
  end
  
  def update
 #   ActiveRecord::Base.transaction do
      @project = Project.find params[:id]
      if @project.update(project_params)
 #       message = define_admin_user
        flash[:success] = "#{@project.name} was successfully updated"
        redirect_to root_path
      else
        render 'edit'
      end
    end
#  end

  private
    def project_params
      params.require(:project).permit(:name, :email, :address, :no_buildings, :no_units)
    end

end
