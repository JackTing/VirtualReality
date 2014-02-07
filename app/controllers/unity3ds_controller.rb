class Unity3dsController < ApplicationController
  before_action :set_unity3d, only: [:show, :edit, :update, :destroy]
  #非法用户访问需要以下内容需要登陆
  before_filter :authenticate_user!,:only =>[:show,:index,:edit,:new]
  # GET /unity3ds.json
  def index
   #@unity3ds = Unity3d.all
   @unity3ds= Unity3d.order(:name).page params[:page]
  end
  def all
    @unity3ds = Unity3d.all
  end
  def infos
    @unity3d=Unity3d.find_by_objectname(params[:objectname])
    if @unity3d!=nil
      @infos=@unity3d.infos
      respond_to do |format|
        format.html { render action: 'infos' }
        format.json { render json: @infos }
      end
   else
       render :text=> 'error'
   end
  end
  # GET /unity3ds/1
  # GET /unity3ds/1.json
  def show
  end

  # GET /unity3ds/new
  def new
    @unity3d = Unity3d.new
  end

  # GET /unity3ds/1/edit
  def edit
  end

  # POST /unity3ds
  # POST /unity3ds.json
  def create
    @unity3d = Unity3d.new(unity3d_params)
    @unity3d.source=uploadfile(params[:file]["file"])   
    #@unity3d.source="Prefabs/QinZhouGang/#{@unity3d.source}.unity3d"
    respond_to do |format|
      if @unity3d.save
        format.html { redirect_to @unity3d, notice: 'Unity3d was successfully created.' }
        format.json { render action: 'show', status: :created, location: @unity3d }
      else
        format.html { render action: 'new' }
        format.json { render json: @unity3d.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /unity3ds/1
  # PATCH/PUT /unity3ds/1.json
  def update
    if(params[:file])
     @unity3d.source=uploadfile(params[:file]["file"])   
    end
    respond_to do |format|
      if @unity3d.update(unity3d_params)
        format.html { redirect_to @unity3d, notice: 'Unity3d was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @unity3d.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unity3ds/1
  # DELETE /unity3ds/1.json
  def destroy
    @unity3d.destroy
    respond_to do |format|
      format.html { redirect_to unity3ds_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_unity3d
      @unity3d = Unity3d.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def unity3d_params
      params.require(:unity3d).permit(:name, :category, :objectname,:source, :use, :plan,:num,:option)
    end
end
