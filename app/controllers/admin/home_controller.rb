class Admin::HomeController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def search_canines
    @characteristics = Characteristic.all.order(order: :asc)
    if params[:characteristics] or params[:characteristicDetail]
      characteristics = params[:characteristics]
      characteristic_detail = params[:characteristicDetail]
      @canines = Canine.find_by_sql "SELECT canines.id, canines.name FROM canines 
                                  JOIN canino_characteristics
                                  ON (canino_characteristics.canine_id = canines.id)  
                                  JOIN characteristics  
                                  ON (characteristics.id = characteristic_id) 
                                  WHERE characteristics.id = some(array#{characteristics.map(&:to_i)}) AND canino_characteristics.value = some(array#{characteristic_detail.map(&:to_i)}) "
      @canines = @canines.uniq.paginate(:page =>  params[:page], :per_page => 15)
    else
      @canines = Canine.all.paginate(:page =>  params[:page], :per_page => 15)
    end
    respond_to do |format|
      format.js
      format.html      
    end
  end

  def index_canines
  end

  def send_mail
  end
  
  def send_mail_attachments
    name = params[:name]
    email = params[:email]
    NotificationMailer.send_email(name, email).deliver_now
    redirect_to admin_send_email_path, notice: 'Envio del Metter'
  end
end
