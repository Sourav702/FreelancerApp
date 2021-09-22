class JobsController < ApplicationController
before_action :check_user_access, only: [:edit,:update,:destroy]
def index
  @job = Job.where(["title LIKE ?","%#{params[:search]}%"])
end

def new
  @job = Job.new
end
def create
  @job = Job.new(params_jobs)
  @job.user_id=current_user.id
  if @job.save
    flash[:success] = "Object successfully created"
    redirect_to @job
  else
    flash[:error] = "Something went wrong"
    render 'new'
  end
end
def edit
  @job = Job.find(params[:id])
end
def update
  @job = Job.find(params[:id])
    if @job.update_attributes(params_jobs)
      flash[:success] = "Object was successfully updated"
      redirect_to @job
    else
      flash[:error] = "Something went wrong"
      render 'edit'
    end
end
def show
  @job = Job.find(params[:id])
end
def destroy
  @job = Job.find(params[:id])
  if @job.destroy
    flash[:success] = 'Object was successfully deleted.'
    redirect_to jobs_url
  else
    flash[:error] = 'Something went wrong'
    redirect_to jobs_url
  end
end
def mypost
  @job = Job.find_by(params[:user_id])
end
private
def params_jobs
  params.require(:job).permit(:title,:description,:stipend)
end
def check_user_access
  @job = Job.find(params[:id])
  if @job.user !=current_user
    flash[:alert]="unauthorized access"
    redirect_to root_path
  end
end

end