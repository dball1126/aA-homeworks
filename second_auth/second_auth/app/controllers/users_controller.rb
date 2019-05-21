def UsersController < ApplicationController
    before_action :ensure_logged_in, except: [:new, :create]

    def new
        @user = User.new
        render :new
    end


    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
        else 
            flash.now[:errors] = ["User creation failed"]
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:new, :create)
    end
end