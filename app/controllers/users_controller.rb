class UsersController < ApplicationController
    before_action :authenticated!, only: [:show]
    def show
        @user = User.find(params[:id])
        @user_events =  current_user.events
        @event = @user.events.build
        @users_names = User.all_users_names
        user_attending_events
    end

    def new 
        @user = User.new
    end

    def create
        @user = User.new(user_params) 
        if @user.save
            flash[:success] = 'User created'
            redirect_to @user
        else
            flash[:danger]=  "there was and error #{@user.errors.full_messages}"
            render 'new'
        end
    end


    private

    def user_params
      params.require(:user).permit(:name)
    end

    def user_attending_events
        @attending  = EventAttendance.where(attendee_id:current_user.id).map {|a| a.attended_event_id }
        @attending_events = @attending.map { |e| Event.find(e) }
    end
end
