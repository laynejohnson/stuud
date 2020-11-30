# Preview all emails at http://localhost:3000/rails/mailers/event_mailer
class EventMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/event_mailer/confirmation
  def confirmation
    client = Client.first
    EventMailer.with(client: client).confirmation
  end

end
