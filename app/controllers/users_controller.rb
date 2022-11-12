class UsersController < ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(allowed_user_params)
    if @user.save
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/edit
  def edit
    @user = User.find(params[:id])
  end

    # POST /users
  def update
    @user = User.find(params[:id])
    if @user.update(allowed_user_params)
      redirect_to new_user_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def allowed_user_params
    params.require(:user).permit(:username,:email,:password)
  end

end
