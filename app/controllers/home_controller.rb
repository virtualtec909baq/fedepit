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
  	NotificationMailer.contact_email(name, email, body).deliver_now
  	redirect_to home_contactus_path, notice: 'Envio de mensaje'
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

  def metter
   @characteristics =  Characteristic.all.order(order: :asc)
  end

  def create_metter
    temporal_id = CaninoCharacteristic.where.not(:temporal_id => nil)
    if temporal_id.empty?
      temporal_id = CaninoCharacteristic.last.id
    else
      temporal_id = temporal_id.last.temporal_id
    end
    temporal_id = temporal_id.to_i + 1
    params[:characteristics].each do |key , value|
      unless value.empty?
        CaninoCharacteristic.create( characteristic_id: key, value: value,temporal_id: temporal_id, temporal_owner: params[:temporal_owner], temporal_phone: params[:temporal_phone], temporal_email: params[:temporal_email], temporal_sex: params[:temporal_sex], temporal_color: params[:temporal_color], temporal_birth: params[:temporal_birth], temporal_lof: params[:temporal_lof],temporal_race: params[:temporal_race], temporal_canine_name: params[:temporal_canine_name], observations: params[:observations], status: false)
      end
    end
    respond_to do |format|
      format.js { js_redirect_to(root_path())}
    end
  end
end
