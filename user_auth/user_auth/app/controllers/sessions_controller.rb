def SessionsController < ApplicationController
    before_action :ensure_logged_in, except: [:new, :create]

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username],
                                              [:user][:password])
        
        unless use.nil?
            login!(@user)
        else
            flash.now[:errors] = ["unable to log in the user"]
            render :new
        end
    
    end

    def destroy
        logged_out!
        redirect_to new_session_url
    end
end