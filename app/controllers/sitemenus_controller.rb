class SitemenusController < ApplicationController
  before_action :set_sitemenu, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /sitemenus
  # GET /sitemenus.json
  def index
    @sitemenus = Sitemenu.order(:name).page params[:page]
  end
  # GET /sitemenus/1
  # GET /sitemenus/1.json
  def show
  end
  
  # GET /sitemenus/new
  def new
    @sitemenu = Sitemenu.new
  end

  # GET /sitemenus/1/edit
  def edit
  end

  # POST /sitemenus
  # POST /sitemenus.json
  def create
    @sitemenu = Sitemenu.new(sitemenu_params)

    respond_to do |format|
      if @sitemenu.save
        format.html { redirect_to @sitemenu, notice: 'sitemenu was successfully created.' }
        #format.json { render action: 'show', status: :created, location: @sitemenu }
        format.json { render :json => @sitemenu}
      else
        format.html { render action: 'new' }
        #format.json { render json: @sitemenu.errors, status: :unprocessable_entity }
         format.json { render :json => {:errors => @sitemenu.errors.full_messages.join(',')} } 
      end
    end
  end

  # PATCH/PUT /sitemenus/1
  # PATCH/PUT /sitemenus/1.json
  def update
    respond_to do |format|
      if @sitemenu.update(sitemenu_params)
        format.html { redirect_to @sitemenu, notice: 'sitemenu was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @sitemenu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sitemenus/1
  # DELETE /sitemenus/1.json
  def destroy
    @sitemenu.destroy
    respond_to do |format|
      format.html { redirect_to sitemenus_url }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sitemenu
      @sitemenu = Sitemenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sitemenu_params
      params.require(:sitemenu).permit(:name,:custom_sort,:action)
    end
end
