class BuildingsController < ApplicationController

  def index
    @project = Project.find(session[:project_id])
    @buildings = @project.buildings.paginate(page: params[:page], per_page: 10)
    store_location
  end

  def show
    @building = Building.find(params[:id])
  end

  def edit
    @building = Building.find(params[:id])
  end

  def update
    @building = Building.find(params[:id])
    if @building.update(building_params)
      flash[:success] = "#{@building.id} was successfully updated."
      redirect_back_or root_path
    else
      render 'edit'
    end
  end

  private
    def building_params
      params.require(:building).permit(:name, :address)
    end
end
