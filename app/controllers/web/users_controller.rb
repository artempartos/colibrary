class Web::UsersController < Web::ApplicationController
  def new
    @user = UserRegistrationType.new
    @user.companies.build
    respond_with @user
  end

  def create
    @user = UserRegistrationType.new
    @user.assign_attributes(params[:user])
    @user.generate_confirmation_token
    if @user.save
      UserMailer.confirmation_instructions(@user).deliver
      f(:success)
      redirect_to root_path
    else
      f(:error)
      render :new
    end
  end

  def confirm
    @user = User.where(params.extract(:confirmation_token)).find(params[:id])
    if @user.confirm
      f(:success)
    else
      f(:error)
    end
    redirect_to root_path
  end
end
