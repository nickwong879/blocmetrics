class ApplicationsController < ApplicationController
  def index
  	@applications = Application.all
  end

  def show
  	@application = Application.find(params[:id])
  end

  def new
  	@application = Application.new
  end

  def create
  	@application = current_user.applications.new(app_params)
  	if @application.save
  		flash[:notice] = "Application registered successfully"
  		redirect_to applications_path
  	else
  		flash[:error] = "Error registering application, please try again."
  		render :new
  	end

  end

  def edit
  	@application = Application.find(params[:id])
  end

  def update
    @application = Application.find(params[:id])
    if @application.update_attributes(app_params)
      flash[:notice] = "Registration updated successfully"
      redirect_to application_path
    else
      flash[:error] = "Error updating registered application, please try again"
      render :edit
    end

  end

  def destroy
  	@application = Application.find(params[:id])
  	if @application.destroy
  		flash[:notice] = "Application was de-registered successfully"
  		redirect_to applications_path
  	else
  		flash[:error] = "Error deleting the application from Blocmetrics"
  		render :show
  	end

  end

private

def app_params
	params.require(:application).permit(:name, :summary, :URL)
end

end