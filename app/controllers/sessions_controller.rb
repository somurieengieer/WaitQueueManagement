class SessionsController < ApplicationController
  def new
  end
  def create
    admin = Administrator.find_by(mail: session_params[:email])
    if admin&.authenticate(session_params[:password])
      session[:admin_id] = admin.id
      redirect_to root_path, notice: 'Login Successful'
    else
      redirect_to login_path, notice: 'Login Faild2'
    end
  end

  private
    def session_params
      params.require(:session).permit(:email, :password)
    end
end
