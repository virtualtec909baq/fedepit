class NotificationMailer < ActionMailer::Base
  default from: 'no-responder@fedepit.com',
          return_path: 'desarrollo@solutek.com.co'

  	def contact_email(name, email, body)
        @name = name
        @email = email
        @body = body
        mail(to: "mmfredyh@hotmail.com",from: email, subject: 'Fedepit Notificación')
    end

    def send_email(name, email)
    	@name = name
      @email = email
    	attachments["metter.pdf"] = File.read("#{Rails.root}/public/metter.pdf")
    	mail(:to => @email, :subject => "Formulario Metter")
  	end
end