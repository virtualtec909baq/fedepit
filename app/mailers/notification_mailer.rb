class NotificationMailer < ActionMailer::Base
  default from: 'no-responder@fedepit.com',
          return_path: 'desarrollo@solutek.com.co'

  def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        mail(to: "jenniffer54@gmail.com",from: email, subject: 'Contact Request')
    end
end