class QueuedUsersController < ApplicationController
  before_action :set_queued_user, only: [:show, :edit, :update, :destroy]

  # GET /queued_users
  # GET /queued_users.json
  def index
    @queued_users = QueuedUser.all
  end

  # GET /queued_users/1
  # GET /queued_users/1.json
  def show
  end

  # GET /queued_users/new
  def new
    @queued_user = QueuedUser.new
  end

  # GET /queued_users/1/edit
  def edit
  end

  # POST /queued_users
  # POST /queued_users.json
  def create
    @queued_user = QueuedUser.new(queued_user_params)

    respond_to do |format|
      if @queued_user.save
        format.html { redirect_to @queued_user, notice: 'Queued user was successfully created.' }
        format.json { render :show, status: :created, location: @queued_user }
      else
        format.html { render :new }
        format.json { render json: @queued_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queued_users/1
  # PATCH/PUT /queued_users/1.json
  def update
    respond_to do |format|
      if @queued_user.update(queued_user_params)
        format.html { redirect_to @queued_user, notice: 'Queued user was successfully updated.' }
        format.json { render :show, status: :ok, location: @queued_user }
      else
        format.html { render :edit }
        format.json { render json: @queued_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queued_users/1
  # DELETE /queued_users/1.json
  def destroy
    @queued_user.destroy
    respond_to do |format|
      format.html { redirect_to queued_users_url, notice: 'Queued user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_queued_user
      @queued_user = QueuedUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def queued_user_params
      params.require(:queued_user).permit(:Name, :Question, :Status, :PeerHelp)
    end

end
