class Admin::HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def send_mail
  end
  
  def send_mail_attachments
    name = params[:name]
    email = params[:email]
    NotificationMailer.send_email(name, email).deliver_now
    redirect_to admin_send_email_path, notice: 'Envio del Metter'
  end

  
  def realizarcruce
     @search = Canine.ransack(params[:q])
     @canines = @search.result.order(name: :asc).page(params[:page])
     @features = Feature.all
  end

  def mergecanines
    @canine = Canine.find(params[:id])
    @search = Canine.ransack(params[:q])
    @canines = @search.result(distinct: true)
  end
end
