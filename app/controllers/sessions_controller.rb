class SessionsController < ApplicationController
  def create
    admin = Administrator.find_by(mail: session_params[:mail])
    if admin&.authenticate(session_params[:password])
      session[:admin_id] = admin.id
      # redirect_to root_path, notice: "Login Successful. Hello \"#{admin.name}\""
      redirect_to admin, notice: "Login Successful. Hello \"#{admin.name}\""
    else
      redirect_to login_path, notice: 'Login Faild. type correct e-mail and password.'
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'Logout Successful'
  end

  private
    def session_params
      params.require(:session).permit(:mail, :password)
    end
end
