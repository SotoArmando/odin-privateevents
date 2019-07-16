class SessionsController < ApplicationController
    def create 
        @session = User.find_by(name: params[:session][:name])
        if @session
            log_in @session
            flash[:success] = 'welcome'
            puts current_user
            redirect_to '/'
        end
    end
    def new

    end





end
