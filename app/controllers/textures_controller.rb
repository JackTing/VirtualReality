class TexturesController < ApplicationController
  before_action :set_texture, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!,:only =>[:show,:index,:edit,:new]
  def index
    @textures = Texture.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @textures }
    end
  end
  def show
    @texture = Texture.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @texture }
    end
  end

end
