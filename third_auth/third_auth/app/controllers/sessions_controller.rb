class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username],
                                              [:user][:password])
        unless user.nil?
            login!(user)
            redirect_to users_url
        else 
            flash.now[:errors] = ["invalid credentials"]
            render :new
        end
    end

    def destroy
        logged_out
        redirect_to new_session_url
    end
end