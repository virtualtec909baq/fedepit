class HomeController < ApplicationController
  
  def index
  	@sponsors = Sponsor.where(status: true).last(5).reverse
  	@articles = Article.last(3).reverse	
  	@canines = Canine.last(4).reverse
  end
  
  def contactus
  end

  def send_mail
  	name = params[:name]
  	email = params[:email]
  	body = params[:comments]
  	NotificationMailer.contact_email(name, email, body).deliver
  	redirect_to home_contactus_path, notice: 'Envio de mensaje'
  end

  def sumula
  end

end
