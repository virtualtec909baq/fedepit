class CaninesController < ApplicationController
  include ApplicationHelper
  def index
    @canines = Canine.all
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(name: :ASC).paginate(page: params[:page], per_page: 12)
    @canine = Canine.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def childrens
    @canine = Canine.find(params[:id])
  end

  def endogamia
    @canine = Canine.find(params[:id])
    @array_ancestor = get_ancestor_with_hash(@canine, 0)
  end
  def calculate_endogamia
    @canine = Canine.find(params[:id])
  end

  # GET /canines/mergecanines
  def mergecanines
    @canine = Canine.find(params[:id])
    @search = Canine.ransack(params[:q])
    @canines = @search.result(distinct: true)
    @root_canines = []
    @ancestors_id = get_ancestors(@canine,0)
    get_ancestor_level(@canine, 0).each do |key|
      key.each do |key, val|
        array_key = key.split("/")
        canine_array = [val,  val.name, array_key[0], number_to_percentage(array_key[1], precision: 3) , array_key[2], array_key[3], count_of_element(@ancestors_id, val.id), val.id]
        @root_canine = canine_array
      end
      @root_canines << @root_canine
    end
    respond_to do |format|
      format.js {}
      format.html {}
    end
  end

   def pedigree_complex
    if Canine.find(params[:id]).gender == 1
      @canine = Canine.find(params[:id])
    else
      @canine_2 = Canine.find(params[:id])
    end
    
    if Canine.find(params[:id_2]).gender == 1
      @canine = Canine.find(params[:id_2])
    else
      @canine_2 = Canine.find(params[:id_2])
    end

    #papa
    if Canine.exists?(@canine.lft) 
      canine_lft = Canine.find(@canine.lft)
      @canine_lftname = canine_lft.name
      @canine_lftpic = pic_canine(canine_lft)
      @canine_lftid = canine_lft.id
      
      if Canine.exists?(canine_lft.lft)
        canine_lft_lft = Canine.find(canine_lft.lft)
        @canine_lft_lftname = canine_lft_lft.name
        @canine_lft_lftpic = pic_canine(canine_lft_lft)
        @canine_lft_lftid = canine_lft_lft.id
        if Canine.exists?(canine_lft_lft.lft) 
          canine_lft_lft_lft = Canine.find(canine_lft_lft.lft)
          @canine_lft_lft_lftname = canine_lft_lft_lft.name
          @canine_lft_lft_lftid = canine_lft_lft_lft.id
        else
          @canine_lft_lft_lftname = ''
          @canine_lft_lft_lftid = 0
        end
        if Canine.exists?(canine_lft_lft.rgt)
          canine_lft_lft_rgt = Canine.find(canine_lft_lft.rgt)
          @canine_lft_lft_rgtname = canine_lft_lft_rgt.name
          @canine_lft_lft_rgtid = canine_lft_lft_rgt.id
        else
          @canine_lft_lft_rgtname = ' '
          @canine_lft_lft_rgtid = 0
        end
      else
        @canine_lft_lftname = ''
        @canine_lft_lftpic = ''
        @canine_lft_lftid = 0
      end

      if Canine.exists?(canine_lft.rgt)
        canine_lft_rgt = Canine.find(canine_lft.rgt)
        @canine_lft_rgtname = canine_lft_rgt.name
        @canine_lft_rgtpic = pic_canine(canine_lft_rgt)
        @canine_lft_rgtid = canine_lft_rgt.id
        if Canine.exists?(canine_lft_rgt.lft)
          canine_lft_rgt_lft = Canine.find(canine_lft_rgt.lft)
          @canine_lft_rgt_lftname = canine_lft_rgt_lft.name
          @canine_lft_rgt_lftid = canine_lft_rgt_lft.id
        else
          @canine_lft_rgt_lftname = ''
          @canine_lft_rgt_lft_lftid = 0
          
        end
        if Canine.exists?(canine_lft_rgt.rgt)
          canine_lft_rgt_rgt = Canine.find(canine_lft_rgt.rgt)
          @canine_lft_rgt_rgtname = canine_lft_rgt_rgt.name
          @canine_lft_rgt_rgtid = canine_lft_rgt_rgt.id
        else
           @canine_lft_rgt_rgtname = ''
           @canine_lft_rgt_rgtid = 0
        end
      else
        @canine_lft_rgtname = ''
        @canine_lft_rgtpic = ''
        @canine_lft_rgtid = 0
      end

      else
        @canine_lftname = ""
        @canine_lftpic = ""
        @canine_lftid= 0
      end
      
      if Canine.exists?(@canine.rgt) 
        canine_rgt = Canine.find(@canine.rgt)
        @canine_rgtname = canine_rgt.name
        @canine_rgtpic = pic_canine(canine_rgt)
        @canine_rgtid = canine_rgt.id
        if Canine.exists?(canine_rgt.lft)
          canine_rgt_lft = Canine.find(canine_rgt.lft)
          @canine_rgt_lftname = canine_rgt_lft.name
          @canine_rgt_lftpic = pic_canine(canine_rgt_lft)
          @canine_rgt_lftid = canine_rgt_lft.id
          if Canine.exists?(canine_rgt_lft.lft)
            canine_rgt_lft_lft = Canine.find(canine_rgt_lft.lft)
            @canine_rgt_lft_lftname = canine_rgt_lft_lft.name
            @canine_rgt_lft_lftid = canine_rgt_lft_lft.id
          else
            @canine_rgt_lft_lftname = ''
            @canine_rgt_lft_lftid = 0
          end

          if Canine.exists?(canine_rgt_lft.rgt)
            canine_rgt_lft_rgt = Canine.find(canine_rgt_lft.rgt)
            @canine_rgt_lft_rgtname = canine_rgt_lft_rgt.name
            @canine_rgt_lft_rgtid = canine_rgt_lft_rgt.id
          else
            @canine_rgt_lft_rgtname = ''
            @canine_rgt_lft_rgtid = 0
          end
        else
          @canine_rgt_lftname = ''
          @canine_rgt_lftpic = ''
          @canine_rgt_lftid = 0
        end

        if Canine.exists?(canine_rgt.rgt)
          canine_rgt_rgt = Canine.find(canine_rgt.rgt)
          @canine_rgt_rgtname = canine_rgt_rgt.name
          @canine_rgt_rgtpic = pic_canine(canine_rgt_rgt)
          @canine_rgt_rgtid = canine_rgt_rgt.id
          if Canine.exists?(canine_rgt_rgt.lft)
            canine_rgt_rgt_lft = Canine.find(canine_rgt_rgt.lft)
            @canine_rgt_rgt_lftname = canine_rgt_rgt_lft.name
            @canine_rgt_rgt_lftid = canine_rgt_rgt_lft.id
          else
            @canine_rgt_rgt_lftname = ""
            @canine_rgt_rgt_lftid = 0
          end
          if Canine.exists?(canine_rgt_rgt.rgt)
            canine_rgt_rgt_rgt = Canine.find(canine_rgt_rgt.rgt)
            @canine_rgt_rgt_rgtname = canine_rgt_rgt_rgt.name
            @canine_rgt_rgt_rgtid = canine_rgt_rgt_rgt.id
          else
            @canine_rgt_rgt_rgtname = ""
            @canine_rgt_rgt_rgtid = 0
          end
        else
          @canine_rgt_rgtname = ''
          @canine_rgt_rgtpic = ''
          @canine_rgt_rgtid = 0
        end

      else
        @canine_rgtname = ""
        @canine_rgtpic = ""
        @canine_rgtid= 0
    end
    
    #mama izquiera
    if Canine.exists?(@canine_2.lft)
      canine_2_lft = Canine.find(@canine_2.lft)
      @canine_2_lftname = canine_2_lft.name
      @canine_2_lftpic = pic_canine(canine_2_lft)
      @canine_2_lftid = canine_2_lft.id
      if Canine.exists?(canine_2_lft.lft)
        canine_2_lft_lft = Canine.find(canine_2_lft.lft)
        @canine_2_lft_lftname = canine_2_lft_lft.name
        @canine_2_lft_lftpic = pic_canine(canine_2_lft_lft)
        @canine_2_lft_lftid = canine_2_lft_lft.id
        if Canine.exists?(canine_2_lft_lft.lft)
          canine_2_lft_lft_lft = Canine.find(canine_2_lft_lft.lft)
          @canine_2_lft_lft_lftname = canine_2_lft_lft_lft.name
          @canine_2_lft_lft_lftid = canine_2_lft_lft.id
        else
          @canine_2_lft_lft_lftname = ""
          @canine_2_lft_lft_lftid = 0
        end
        if Canine.exists?(canine_2_lft_lft.rgt)
          canine_2_lft_lft_rgt = Canine.find(canine_2_lft_lft.rgt)
          @canine_2_lft_lft_rgtname = canine_2_lft_lft_rgt.name
          @canine_2_lft_lft_rgtid = canine_2_lft_lft_rgt.id
        else
          @canine_2_lft_lft_rgtname = ""
          @canine_2_lft_lft_rgtid = 0
        end
      else
        @canine_2_lft_lftname = ""
        @canine_2_lft_lftpic = ""
        @canine_2_lft_lftid = 0
      end
      if  Canine.exists?(canine_2_lft.rgt)
        canine_2_lft_rgt = Canine.find(canine_2_lft.rgt)
        @canine_2_lft_rgtname = canine_2_lft_rgt.name
        @canine_2_lft_rgtpic = pic_canine(canine_2_lft_rgt)
        @canine_2_lft_rgtid = canine_2_lft_rgt.id
        if Canine.exists?(canine_2_lft_rgt.lft)
          canine_2_lft_rgt_lft = Canine.find(canine_2_lft_rgt.lft)
          @canine_2_lft_rgt_lftid = canine_2_lft_rgt_lft.id
          @canine_2_lft_rgt_lftname = canine_2_lft_rgt_lft.name
        else
          @canine_2_lft_rgt_lftid = 0
          @canine_2_lft_rgt_lftname = ""
        end

        if Canine.exists?(canine_2_lft_rgt.rgt)
          canine_2_lft_rgt_rgt = Canine.find(canine_2_lft_rgt.rgt)
          @canine_2_lft_rgt_rgtid = canine_2_lft_rgt_rgt.id
          @canine_2_lft_rgt_rgtname = canine_2_lft_rgt_rgt.name
        else
          @canine_2_lft_rgt_rgtid = 0
          @canine_2_lft_rgt_rgtname = ""
        end
      else
        @canine_2_lft_rgtname = ""
        @canine_2_lft_rgtpic = ""
        @canine_2_lft_rgtid = 0
      end
    else
      @canine_2_lftname = ""
      @canine_2_lftpic = ""
      @canine_2_lftid = 0
    end
    #mama derecha
    if Canine.exists?(@canine_2.rgt)
      canine_2_rgt = Canine.find(@canine_2.rgt)
      @canine_2_rgtname = canine_2_rgt.name
      @canine_2_rgtpic = pic_canine(canine_2_rgt)
      @canine_2_rgtid = canine_2_rgt.id
      if Canine.exists?(canine_2_rgt.lft)
        canine_2_rgt_lft = Canine.find(canine_2_rgt.lft)
        @canine_2_rgt_lftname = canine_2_rgt_lft.name
        @canine_2_rgt_lftpic = pic_canine(canine_2_rgt_lft)
        @canine_2_rgt_lftid = canine_2_rgt_lft.id
        if Canine.exists?(canine_2_rgt_lft.lft)
          canine_2_rgt_lft_lft = Canine.find(canine_2_rgt_lft.lft)
          @canine_2_rgt_lft_lftname = canine_2_rgt_lft_lft.name
          @canine_2_rgt_lft_lftid = canine_2_rgt_lft_lft.id
        else
          @canine_2_rgt_lft_lftname = ""
          @canine_2_rgt_lft_lftid = 0
        end
        if Canine.exists?(canine_2_rgt_lft.rgt)
          canine_2_rgt_lft_rgt = Canine.find(canine_2_rgt_lft.rgt)
          @canine_2_rgt_lft_rgtname = canine_2_rgt_lft_rgt.name
          @canine_2_rgt_lft_rgtid = canine_2_rgt_lft_rgt.id
        else
          @canine_2_rgt_lft_rgtname = ""
          @canine_2_rgt_lft_rgtid = 0
        end
      else
        @canine_2_rgt_lftname = ""
        @canine_2_rgt_lftpic = ""
        @canine_2_rgt_lftid = 0
      end
      if Canine.exists?(canine_2_rgt.rgt)
        canine_2_rgt_rgt = Canine.find(canine_2_rgt.rgt)
        @canine_2_rgt_rgtname = canine_2_rgt_rgt.name
        @canine_2_rgt_rgtpic = pic_canine(canine_2_rgt_rgt)
        @canine_2_rgt_rgtid = canine_2_rgt_rgt.id
        if Canine.exists?(canine_2_rgt_rgt.lft)
          canine_2_rgt_rgt_lft = Canine.find(canine_2_rgt_rgt.lft)
          @canine_2_rgt_rgt_lftname = canine_2_rgt_rgt_lft.name
          @canine_2_rgt_rgt_lftid = canine_2_rgt_rgt_lft.id
        else
          @canine_2_rgt_rgt_lftname = ''
          @canine_2_rgt_rgt_lftid = 0
        end
        if Canine.exists?(canine_2_rgt_rgt.rgt)
          canine_2_rgt_rgt_rgt = Canine.find(canine_2_rgt_rgt.rgt)
          @canine_2_rgt_rgt_rgtname = canine_2_rgt_rgt_rgt.name
          @canine_2_rgt_rgt_rgtid = canine_2_rgt_rgt_rgt.id
        else
          @canine_2_rgt_rgt_rgtname = ''
          @canine_2_rgt_rgt_rgtid = 0
        end

      else
        @canine_2_rgt_rgtname = ""
        @canine_2_rgt_rgtpic = ""
        @canine_2_rgt_rgtid = 0
      end
    else
      @canine_2_rgtname = ""
      @canine_2_rgtpic = ""
      @canine_2_rgtid = 0
    end
  end
  
  def pedigree
    # papa
    @canine = Canine.find(params[:id])
    if Canine.exists?(@canine.lft) 
      canine_lft = Canine.find(@canine.lft)
      @canine_lftname = canine_lft.name
      @canine_lftpic = pic_canine(canine_lft)
      @canine_lftid= canine_lft.id
      # abuelos paternos
      if Canine.exists?( canine_lft.lft)
        canine_lft_lft = Canine.find(canine_lft.lft)
        @canine_lft_lftname = canine_lft_lft.name
        @canine_lft_lftpic = pic_canine(canine_lft_lft)
        @canine_lft_lftid = canine_lft_lft.id
        if Canine.exists?(canine_lft_lft.lft)
          canine_lft_lft_lft = Canine.find(canine_lft_lft.lft)
          @canine_lft_lft_lftname = canine_lft_lft_lft.name
          @canine_lft_lft_lftpic = pic_canine(canine_lft_lft_lft)
          @canine_lft_lft_lftid = canine_lft_lft_lft.id
          if Canine.exists?(canine_lft_lft_lft.lft) 
            canine_lft_lft_lft_lft = Canine.find(canine_lft_lft_lft.lft)
            @canine_lft_lft_lft_lftname = canine_lft_lft_lft_lft.name
            @canine_lft_lft_lft_lftid = canine_lft_lft_lft_lft.id
          else
            @canine_lft_lft_lft_lftname =  ""
            @canine_lft_lft_lft_lftid = 0
          end
          if Canine.exists?(canine_lft_lft_lft.rgt)
              canine_lft_lft_lft_rgt = Canine.find(canine_lft_lft_lft.rgt)
              @canine_lft_lft_lft_rgtname = canine_lft_lft_lft_rgt.name
              @canine_lft_lft_lft_rgtid = canine_lft_lft_lft_rgt.id
          else
            @canine_lft_lft_lft_rgtname =  ""
            @canine_lft_lft_lft_rgtid = 0
          end
        else
          @canine_lft_lft_lftname = ""
          @canine_lft_lft_lftpic = ""
          @canine_lft_lft_lftid = 0
        end
    if Canine.exists?(canine_lft_lft.rgt)
      canine_lft_lft_rgt = Canine.find(canine_lft_lft.rgt)
      @canine_lft_lft_rgtname = canine_lft_lft_rgt.name
      @canine_lft_lft_rgtpic = pic_canine(canine_lft_lft_rgt)
      @canine_lft_lft_rgtid = canine_lft_lft_rgt.id
    if Canine.exists?(canine_lft_lft_rgt.lft)
      canine_lft_lft_rgt_lft = Canine.find(canine_lft_lft_rgt.lft)
      @canine_lft_lft_rgt_lftname = canine_lft_lft_rgt_lft.name
      @canine_lft_lft_rgt_lftid = canine_lft_lft_rgt_lft.id
    else
      @canine_lft_lft_rgt_lftname = ""
      @canine_lft_lft_rgt_lftid = 0
    end
    if Canine.exists?(canine_lft_lft_rgt.rgt)
      canine_lft_lft_rgt_rgt = Canine.find(canine_lft_lft_rgt.rgt)
      @canine_lft_lft_rgt_rgtname = canine_lft_lft_rgt_rgt.name
      @canine_lft_lft_rgt_rgtid = canine_lft_lft_rgt_rgt.id
    else
      @canine_lft_lft_rgt_rgtname = ""
      @canine_lft_lft_rgt_rgtid = 0
    end
    else
      @canine_lft_lft_rgtname = ""
      @canine_lft_lft_rgtpic = ""
      @canine_lft_lft_rgtid = 0
    end

    else
      @canine_lft_lftname = ""
      @canine_lft_lftpic = ""
      @canine_lft_lftid = 0
    end

    if Canine.exists?(canine_lft.rgt)
      canine_lft_rgt = Canine.find(canine_lft.rgt)
      @canine_lft_rgtname = canine_lft_rgt.name
      @canine_lft_rgtpic = pic_canine(canine_lft_rgt)
      @canine_lft_rgtid = canine_lft_rgt.id

    if Canine.exists?(canine_lft_rgt.lft)
      canine_lft_rgt_lft = Canine.find(canine_lft_rgt.lft)
      @canine_lft_rgt_lftname = canine_lft_rgt_lft.name
      @canine_lft_rgt_lftpic = pic_canine(canine_lft_rgt_lft)
      @canine_lft_rgt_lftid = canine_lft_rgt_lft.id
    if Canine.exists?(canine_lft_rgt_lft.lft)
      canine_lft_rgt_lft_lft = Canine.find(canine_lft_rgt_lft.lft)
      @canine_lft_rgt_lft_lftname = canine_lft_rgt_lft_lft.name
      @canine_lft_rgt_lft_lftid = canine_lft_rgt_lft_lft.id
    else
      @canine_lft_rgt_lft_lftname = ""
      @canine_lft_rgt_lft_lftid = 0
    end
    if Canine.exists?(canine_lft_rgt_lft.rgt)
      canine_lft_rgt_lft_rgt = Canine.find(canine_lft_rgt_lft.rgt)
      @canine_lft_rgt_lft_rgtname = canine_lft_rgt_lft_rgt.name
      @canine_lft_rgt_lft_rgtid = canine_lft_rgt_lft_rgt.id
    else
      @canine_lft_rgt_lft_rgtname = ""
      @canine_lft_rgt_lft_rgtid = 0
    end
    else
      @canine_lft_rgt_lftname = ""
      @canine_lft_rgt_lftpic =  ""
      @canine_lft_rgt_lftid = 0
    end

    if Canine.exists?(canine_lft_rgt.rgt)
      canine_lft_rgt_rgt = Canine.find(canine_lft_rgt.rgt)
      @canine_lft_rgt_rgtname = canine_lft_rgt_rgt.name
      @canine_lft_rgt_rgtpic = pic_canine(canine_lft_rgt_rgt)
      @canine_lft_rgt_rgtid = canine_lft_rgt_rgt.id
      
      if Canine.exists?(canine_lft_rgt_rgt.lft)
        canine_lft_rgt_rgt_lft = Canine.find(canine_lft_rgt_rgt.lft)
        @canine_lft_rgt_rgt_lftname = canine_lft_rgt_rgt_lft.name
        @canine_lft_rgt_rgt_lftid = canine_lft_rgt_rgt_lft.id
      else
        @canine_lft_rgt_rgt_lftname = ""
        @canine_lft_rgt_rgt_lftid = 0
      end
      
      if Canine.exists?(canine_lft_rgt_rgt.rgt)
        canine_lft_rgt_rgt_rgt = Canine.find(canine_lft_rgt_rgt.rgt)
        @canine_lft_rgt_rgt_rgtname = canine_lft_rgt_rgt_rgt.name
        @canine_lft_rgt_rgt_rgtid = canine_lft_rgt_rgt_rgt.id
      else
        @canine_lft_rgt_rgt_rgtname = ""
        @canine_lft_rgt_rgt_rgtid = 0
      end
    else
      @canine_lft_rgt_rgtname = ""
      @canine_lft_rgt_rgtpic =  ""
      @canine_lft_rgt_rgtid = 0
    end

    else
      @canine_lft_rgtname = ""
      @canine_lft_rgtpic = ""
      @canine_lft_rgtid = 0
    end

    else
      @canine_lftname = ""
      @canine_lftpic = ""
      @canine_lftid= 0
    end

    # mama
    if Canine.exists?(@canine.rgt)
      canine_rgt = Canine.find(@canine.rgt)
      @canine_rgtname = canine_rgt.name
      @canine_rgtpic = pic_canine(canine_rgt)
      @canine_rgtid = canine_rgt.id
      if Canine.exists?(canine_rgt.lft)
        canine_rgt_lft = Canine.find(canine_rgt.lft)
        @canine_rgt_lftname = canine_rgt_lft.name
        @canine_rgt_lftpic = pic_canine(canine_rgt_lft)
        @canine_rgt_lftid = canine_rgt_lft.id
        if Canine.exists?(canine_rgt_lft.lft)
          canine_rgt_lft_lft = Canine.find(canine_rgt_lft.lft)
          @canine_rgt_lft_lftname = canine_rgt_lft_lft.name
          @canine_rgt_lft_lftpic = pic_canine(canine_rgt_lft_lft)
          @canine_rgt_lft_lftid = canine_rgt_lft_lft.id
          if Canine.exists?(canine_rgt_lft_lft.lft)
            canine_rgt_lft_lft_lft = Canine.find(canine_rgt_lft_lft.lft)
            @canine_rgt_lft_lft_lftname = canine_rgt_lft_lft_lft.name
            @canine_rgt_lft_lft_lftid = canine_rgt_lft_lft_lft.id
          else
            @canine_rgt_lft_lft_lftname = ""
            @canine_rgt_lft_lft_lftid = 0
          end
          if Canine.exists?(canine_rgt_lft_lft.rgt)
            canine_rgt_lft_lft_rgt = Canine.find(canine_rgt_lft_lft.rgt)
            @canine_rgt_lft_lft_rgtname = canine_rgt_lft_lft_rgt.name
            @canine_rgt_lft_lft_rgtid = canine_rgt_lft_lft_rgt.id
          else
            @canine_rgt_lft_lft_rgtname = ""
            @canine_rgt_lft_lft_lftid = 0
          end
        else
          @canine_rgt_lft_lftname = ""
          @canine_rgt_lft_lftpic = ""
          @canine_rgt_lft_lftid = 0
        end
        if Canine.exists?(canine_rgt_lft.rgt)
          canine_rgt_lft_rgt= Canine.find(canine_rgt_lft.rgt)
          @canine_rgt_lft_rgtname = canine_rgt_lft_rgt.name
          @canine_rgt_lft_rgtpic = pic_canine(canine_rgt_lft_rgt)
          @canine_rgt_lft_rgtid = canine_rgt_lft_rgt.id
          if canine_rgt_lft_rgt.lft
            canine_rgt_lft_rgt_lft = Canine.find(canine_rgt_lft_rgt.lft)
            @canine_rgt_lft_rgt_lftname = canine_rgt_lft_rgt_lft.name
            @canine_rgt_lft_rgt_lftid = canine_rgt_lft_rgt_lft.id
          else
            @canine_rgt_lft_rgt_lftname = ''
            @canine_rgt_lft_rgt_lftid = 0
          end
          if canine_rgt_lft_rgt.rgt
            canine_rgt_lft_rgt_rgt = Canine.find(canine_rgt_lft_rgt.rgt)
            @canine_rgt_lft_rgt_rgtname = canine_rgt_lft_rgt_rgt.name
            @canine_rgt_lft_rgt_rgtid = canine_rgt_lft_rgt_rgt.id
          else
            @canine_rgt_lft_rgt_rgtname = ''
            @canine_rgt_lft_rgt_rgtid = 0
          end
        else
          @canine_rgt_lft_rgtname = ""
          @canine_rgt_lft_rgtpic = ""
          @canine_rgt_lft_rgtid = 0
        end
      else
        @canine_rgt_lftname = ''
        @canine_rgt_lftpic = ''
        @canine_rgt_lftid = 0
      end

      if Canine.exists?(canine_rgt.rgt)
        canine_rgt_rgt = Canine.find(canine_rgt.rgt)
        @canine_rgt_rgtname = canine_rgt_rgt.name
        @canine_rgt_rgtpic = pic_canine(canine_rgt_rgt)
        @canine_rgt_rgtid = canine_rgt_rgt.id
        if Canine.exists?(canine_rgt_rgt.lft) 
          canine_rgt_rgt_lft = Canine.find(canine_rgt_rgt.lft)
          @canine_rgt_rgt_lftname = canine_rgt_rgt_lft.name
          @canine_rgt_rgt_lftpic = pic_canine(canine_rgt_rgt_lft)
          @canine_rgt_rgt_lftid = canine_rgt_rgt_lft.id
          if canine_rgt_rgt_lft.lft
            canine_rgt_rgt_lft_lft = Canine.find(canine_rgt_rgt_lft.lft)
            @canine_rgt_rgt_lft_lftname = canine_rgt_rgt_lft_lft.name
            @canine_rgt_rgt_lft_lftid = canine_rgt_rgt_lft_lft.id
          else
            @canine_rgt_rgt_lft_lftname = ''
            @canine_rgt_rgt_lft_lftid = 0
          end
          if canine_rgt_rgt_lft.rgt
            canine_rgt_rgt_lft_rgt = Canine.find(canine_rgt_rgt_lft.rgt)
            @canine_rgt_rgt_lft_rgtname = canine_rgt_rgt_lft_rgt.name
            @canine_rgt_rgt_lft_rgtid = canine_rgt_rgt_lft_rgt.id
          else
            @canine_rgt_rgt_lft_lftname = ''
            @canine_rgt_rgt_lft_lftid = 0
          end
        else
          @canine_rgt_rgt_lftname = ""
          @canine_rgt_rgt_lftpic = ""
          @canine_rgt_rgt_lftid = ""
        end

        if Canine.exists?(canine_rgt_rgt.rgt) 
          canine_rgt_rgt_rgt= Canine.find(canine_rgt_rgt.rgt)
          @canine_rgt_rgt_rgtname = canine_rgt_rgt_rgt.name
          @canine_rgt_rgt_rgtpic = pic_canine(canine_rgt_rgt_rgt)
          @canine_rgt_rgt_rgtid = canine_rgt_rgt_rgt.id
          if canine_rgt_rgt_rgt.lft
            canine_rgt_rgt_rgt_lft = Canine.find(canine_rgt_rgt_rgt.lft)
            @canine_rgt_rgt_rgt_lftname = canine_rgt_rgt_rgt_lft.name
            @canine_rgt_rgt_rgt_lftid = canine_rgt_rgt_rgt_lft.id
          else
            @canine_rgt_rgt_rgt_lftname = ''
            @canine_rgt_rgt_rgt_lftid = 0
          end
          if canine_rgt_rgt_rgt.rgt
            canine_rgt_rgt_rgt_rgt = Canine.find(canine_rgt_rgt_rgt.rgt)
            @canine_rgt_rgt_rgt_rgtname = canine_rgt_rgt_rgt_rgt.name
            @canine_rgt_rgt_rgt_rgtid = canine_rgt_rgt_rgt_rgt.id
          else
             @canine_rgt_rgt_rgt_rgtname = ""
             @canine_rgt_rgt_rgt_rgtid =  0
          end
        else
          @canine_rgt_rgt_rgtname = ""
          @canine_rgt_rgt_rgtpic = ""
          @canine_rgt_rgt_rgtid = ""
        end
      else
        @canine_rgt_rgtname = ''
        @canine_rgt_rgtpic = ''
        @canine_rgt_rgtid = 0
      end

    else
      @canine_rgtname = ''
      @canine_rgtpic = ''
      @canine_rgtid = 0
    end

  end

  def show
    @canine = Canine.find(params[:id])
    @images = @canine.images
    @array_ancestor = get_ancestor_with_hash(@canine, 0).count
    @ranking = 0
    @canine.champions.each do |category| @ranking = @ranking + category.points end
    @canino_characteristics = CaninoCharacteristic.where(canine_id: params[:id]).order(created_at: :asc)
    respond_to do |format|
     format.html
    end
  end

  def realizarcruce
    @feature = Feature.new
  end

  def merge_canine
    @canines = Canine.all
    @search = Canine.ransack(params[:q])
    @canines = @search.result.order(created_at: :desc).page(params[:page])
    @canine = Canine.new
    respond_to do |format|
      format.html
      format.js
    end
  end
end
