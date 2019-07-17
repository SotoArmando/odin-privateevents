module EventsHelper

  def attending_event(event)
    if current_user.nil?

    else
      event.attendees.where(name:current_user.name).any?
    end
  end
end
