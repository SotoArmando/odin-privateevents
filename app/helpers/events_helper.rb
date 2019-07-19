module EventsHelper

  def attending_event(event)
    if current_user.nil?

    else
      event.attendees.where(name:current_user.name).any?
    end
  end

  def event_attendees(event)
    @event_attendees = event.attendees.map { |u| [u.name, u.id]}
  end
end
