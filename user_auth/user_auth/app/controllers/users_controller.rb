class UsersController < ApplicationController
    :ensure_logged_in, except: [:create, :new]

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
        
        else 
            flash.now[:errors] = ["Unable to create user"]
            render :new
        end
    end


    private

    def user_params
        params.require(:user).permit(:new, :create)
    end
end