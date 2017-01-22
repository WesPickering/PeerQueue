class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by_email(params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to '/queued_users'
    else
      flash[:notice] = "Incorrect email and/or password."
      redirect_to '/'

    end
  end
  def destroy
    @queued_user = QueuedUser.find_by_dbID(session[:user_id])
    if @queued_user
      @queued_user.destroy
      respond_to do |format|
        format.html { redirect_to '/', notice: 'Queued user was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to '/'
    end
    session[:user_id] = nil
  end
end
