class EventMailer < ApplicationMailer
  def confirmation
    @client= params[:client]
    mail(to: @client, subject: 'Lesson confirmed!')
  end
end
