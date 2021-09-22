class FreesessionsController < ApplicationController
  def new
  end

  def create
    freelancer = Freelancer.find_by_email(params[:email])
    if freelancer && freelancer.authenticate(params[:password])
   
      if freelancer.email_confirmed
        session[:freelancer_id] = freelancer.id
        redirect_to root_path, notice: "Logged in!"
    else
      flash.now[:error] = 'Please activate your account by following the 
      instructions in the account confirmation email you received to proceed'
      render 'new'
    end
    else

      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:freelancer_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end
end
