class FreelancersController < ApplicationController
  def index
    @freelancer = Freelancer.where(["industry LIKE ?","%#{params[:search]}%"])
  end
  
def new
  @freelancer = Freelancer.new
end
def create
  @freelancer = Freelancer.new(name: params[:name],
    email: params[:email], 
    password: params[:password], 
    password_confirmation: params[:password_confirmation],
    education: params[:education],
    experience: params[:experience],
    industry: params[:industry]
  )
  if @freelancer.save
    FreelancerMailer.registration_confirmation(@freelancer).deliver
    flash[:success] = "Please confirm your email address to continue"
    redirect_to root_path
  else
    flash[:error] = "Something went wrong"
    render 'new'
  end
end
def show
  @freelancer = Freelancer.find(params[:id])
end
def confirm_email
  freelancer = Freelancer.find_by_confirm_token(params[:id])
  if freelancer
    freelancer.email_activate
    flash[:success] = "Welcome to the Freelancer App! Your email has been confirmed.
    Please sign in to continue."
    redirect_to freelancer_login_url
  else
    flash[:error] = "Sorry. User does not exist"
    redirect_to root_url
  end
end

end