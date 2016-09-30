class Admin::UsersController < Admin::BaseController

  def index
  	@users = User.all
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html {redirect_to admin_users_url, notice: 'User successfully updated'}
      else
        format.html {redirect_to admin_users_url, notice: 'Sorry, something went wrong.'}
      end 
    end
  end
  
  def create
    @user = User.new(user_params)

      @user.password = loop do
        random_token = SecureRandom.urlsafe_base64(nil, false)
        break random_token unless User.exists?(encrypted_password: random_token)
      end

    respond_to do |format|
      if @user.save
        format.html {redirect_to admin_users_url, notice: 'User Successfully created.'}
      else
        format.html {redirect_to :back, notice: @user.errors.full_messages.first}
      end
    end

  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :date_of_birth, :bio,:password)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

  def pdfcommit
    @user = User.find(params[:id])
    @user.send_email_to_dev
    
  end
end
