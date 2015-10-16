class Admin::CaninoCharacteristicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_feature, only: [:show, :edit, :update, :destroy, :update_metter]


  def index
    if params[:index]
      @canines = Canine.find_by_sql "SELECT canines.id, canines.name, canines.lof FROM canines LEFT JOIN canino_characteristics ON canines.id = canino_characteristics.canine_id WHERE canino_characteristics.canine_id IS NULL ORDER BY name ASC"
      @canines = @canines.paginate(:page =>  params[:page], :per_page => 15)
    elsif params[:index_2]
      @canines = Canine.find_by_sql "SELECT canines.id, canines.name, canines.lof FROM canines LEFT JOIN canino_characteristics ON canines.id = canino_characteristics.canine_id  WHERE canino_characteristics.canine_id IS NOT NULL GROUP BY canines.id ORDER BY canines.name ASC "
      @canines = @canines.paginate(:page =>  params[:page], :per_page => 15)
    end
  end

  def new
    if params[:edit]
      @canine_characteristic = CaninoCharacteristic.where.not(:temporal_id => nil).select("DISTINCT ON (temporal_id) *")
    end
    
    if params[:canine_id] == "0"
      @characteristics = Characteristic.all.order(order: :asc)
    else
      @query_1 = Characteristic.all 
      @query_2 = Canine.find(params[:canine_id]).characteristics 
      @characteristics = @query_1 - @query_2
      @characteristics = @characteristics.sort_by &:order
    end
  end

  # POST /characteristics
  # POST /characteristics.json
  def create
    if params[:canine_id] == "0"
      canine_characteristic = CaninoCharacteristic.all.order(temporal_id: :desc).first
      temporal_id = canine_characteristic.temporal_id
      temporal_id =temporal_id +1
      params[:characteristics].each do |key , value|
        CaninoCharacteristic.create( characteristic_id: key, value: value, temporal_canine_name: params[:canine], temporal_id: temporal_id)
      end
      respond_to do |format|
          flash[:notice] = 'Metter Creado Puede Crear uno nuevo'
          format.js { js_redirect_to(new_admin_canino_characteristic_path(canine_id: "0"))}
      end
    else
      params[:characteristics].each do |key , value|
          CaninoCharacteristic.create(canine_id: params[:canine_id], characteristic_id: key, value: value)
      end
      respond_to do |format|
          flash[:notice] = 'Metter Creado'
          format.js { js_redirect_to(admin_canine_path(params[:canine_id]))}
      end
    end
  end


  # GET /characteristics/1/edit
  def edit
    @characteristic = Characteristic.find(@canino_characteristic.characteristic_id)
  end

  def update_metter
    @characteristics = CaninoCharacteristic.where(temporal_id: @canino_characteristic.temporal_id)
    @characteristics.update_all(temporal_id: nil, temporal_canine_name: nil, canine_id: params[:canine_id])
    respond_to do |format|
        flash[:notice] = 'Metter Asociado'
        format.js { js_redirect_to(admin_canine_path(params[:canine_id]))}
    end
  end

  # PATCH/PUT /features/1
  # PATCH/PUT /features/1.json
  def update
    respond_to do |format|
      if @canino_characteristic.update(canino_characteristic_params)
        flash[:notice] = 'Metter Modificado'
        format.js { js_redirect_to(admin_canine_path(@canino_characteristic.canine_id))}
      else
        format.html { render :edit }
        format.json { render json: @canino_characteristic.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /characteristics/1
  # DELETE /characteristics/1.json
  def destroy
    @canino_characteristic.destroy
    respond_to do |format|
      format.html { redirect_to admin_canine_path(@canino_characteristic.canine_id), notice: 'Metter Eliminado' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feature
      @canino_characteristic = CaninoCharacteristic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def canino_characteristic_params
      params.require(:canino_characteristic).permit!
    end
end
