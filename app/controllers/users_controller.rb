class UsersController < Clearance::UsersController
	def edit
		@user = User.find(params[:id])
	end
	def update
		p params
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
      redirect_to @user
    else
      render 'edit'
    end
	end


	private
	def user_params
	  params.require(:user).permit(:name, :email, :country, :gender, :phone, :birthdate, :role, :avatar)
	end
end