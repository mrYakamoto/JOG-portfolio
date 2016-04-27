class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @user = User.find_by(username: "admin")
  end

  def update
    @user = User.find_by(username: "admin")
    @user.update(user_params)
    if @user.save
      flash.now[:success] = ["Bio Successfully Updated"]
    else
      flash.now[:error] = []
      @user.errors.full_messages.each do |msg|
        flash.now[:error] << msg
      end
    end
    render action: 'show'
  end

  private
  def user_params
    params.require(:user).permit(:about_me_body, :picture)
  end
end
