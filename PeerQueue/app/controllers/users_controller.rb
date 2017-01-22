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
    QueuedUser.find_by_id(params[:foo_param]).update_attribute(:beingHelped, true)
    if QueuedUser.find_by_dbID(session[:user_id])
      QueuedUser.find_by_dbID(params[:foo_param]).update_attribute(:beingHelped, true)
      QueuedUser.find_by_dbID(session[:user_id]).update_attribute(:Status, "Helping " + QueuedUser.find_by_id(params[:foo_param]).Name)
    end
    redirect_to QueuedUser.find_by_id(params[:foo_param])
  end

  def finishHelping
    QueuedUser.find_by_id(params[:foo_param]).update_attribute(:Status, "In Queue")
    QueuedUser.find_by_id(params[:foo_param]).update_attribute(:beingHelped, false)
    if QueuedUser.find_by_dbID(session[:user_id])
      QueuedUser.find_by_dbID(params[:foo_param]).update_attribute(:beingHelped, false)
      QueuedUser.find_by_dbID(session[:user_id]).update_attribute(:Status, "In Queue")
    end
    redirect_to queued_users_path
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :role)
  end

end
