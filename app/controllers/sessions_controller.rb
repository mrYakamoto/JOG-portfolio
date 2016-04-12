class SessionsController < ApplicationController
  def login
    if User.find_by(username:"admin").authenticate(admin_params[:password_plaintext])
      session[:admin] = true
      redirect_to '/'
    else
      flash[:error] = "incorrect password"
      render template: 'users/new'
    end
  end

  def logout
    session[:admin] = false
    redirect_to '/'
  end

  private
  def admin_params
    params.require(:admin).permit(:password_plaintext)
  end
end