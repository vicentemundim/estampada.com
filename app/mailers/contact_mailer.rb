class ContactMailer < ActionMailer::Base
  default from: "no-reply@estampada.com",
          to: "contato@estampada.com"

  def contact_email(message)
    @message = message
    reply_to = "#{message.name} <#{message.email}>"
    mail(reply_to: reply_to, subject: "Contato pelo site - #{I18n.l Time.now, format: :custom_with_time}")
  end
end
