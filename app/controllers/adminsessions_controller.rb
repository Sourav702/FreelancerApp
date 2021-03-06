class AdminsessionsController < ApplicationController
def new
end


  def create
    admin = Admin.find_by_email(params[:email])
    if admin && admin.authenticate(params[:password])
        session[:admin_id] = admin.id
        redirect_to root_path, notice: "Logged in!"
    else

      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: "Logged out!"
  end

end