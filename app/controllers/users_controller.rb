class UsersController < ApplicationController
    def show
        @user = User.find(params[:id])
        @user_events =  current_user.events.up_coming
        @user_events_p =  current_user.events.past
        @event = @user.events.build
    end
    def new 
        @user = User.new
    end
    def create
        @user = User.new(user_params) 
        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end


    private

    def user_params
      params.require(:user).permit(:name)
    end
end
