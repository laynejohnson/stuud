class EventMailer < ApplicationMailer
  def confirmation
    @event = params[:event]
    mail(to: @event.client.email, subject: 'Lesson confirmed!')
  end
end
