class UsersController < ApplicationController


  def new
    @user = User.new
  end
  def delete_user
    @user = nil
  end
  def create
    @user = User.new(user_params)
    if User.find_by_email(user_params[:email])
      flash[:notice] = "There is already an acount for this email. Please Login to create your board."
      redirect_to '/'
    elsif @user.save
      session[:user_id] = @user.id
      redirect_to '/queued_users'
    else
      flash[:notice] = "One or more fields are empty."
      redirect_to '/'
    end
  end

  def help
    QueuedUser.find_by_id(params[:foo_param]).update_attribute(:Status, "Being Helped by " + User.find_by_id(session[:user_id]).first_name)
    redirect_to :back
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end

end
