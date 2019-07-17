class SessionsController < ApplicationController
    def create 
        @session = User.find_by(name: params[:session][:name])
        if @session
            log_in @session
            flash[:success] = 'welcome'
            puts current_user
            redirect_to root_path
        else
            flash[:danger] = "There is no #{params[:session][:name]}"
            render :new
        end
    end
    def new

    end

    def destroy
        logout
        redirect_to root_path
    end

end
