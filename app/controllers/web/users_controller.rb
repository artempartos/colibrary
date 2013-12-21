class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
    respond_with @user
  end

  def create
    @user = UserRegistrationType.new
    @user.assign_attributes(params[:user])
    @user.generate_confirmation_token
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def confirm
    @user = User.where(params.extract(:confirmation_token)).find(params[:id])
    @user.confirm
    redirect_to root_path
  end
end
