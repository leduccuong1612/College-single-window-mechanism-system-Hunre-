class NotificationMailer < ApplicationMailer
  def new_notification_email
    @notification = params[:request_words_document]

    mail(to: @notification.email, subject: "You got a new order!")
  end
end
