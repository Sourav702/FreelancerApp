class UsersController < ApplicationController
  def index
    @users = User.all
  end
  
def new
  @user = User.new
end
def create
  @user = User.create(user_params)
  if @user.save
    UserMailer.registration_confirmation(@user).deliver
    flash[:success] = "Please confirm your email address to continue"
    redirect_to root_path
  else
    flash[:error] = "Something went wrong"
    render 'new'
  end
end
def show
  @user = User.find(params[:id])
end
def confirm_email
  user = User.find_by_confirm_token(params[:id])
  if user
    user.email_activate
    flash[:success] = "Welcome to the Freelancer App! Your email has been confirmed.
    Please sign in to continue."
    redirect_to login_url
  else
    flash[:error] = "Sorry. User does not exist"
    redirect_to root_url
  end
end
def profile
  @job = Job.where({ user_id: [current_user.id]})
end
private
def user_params
  params.permit(:name,:email,:password,:password_confirmation,:industry,params[:image])
end


end