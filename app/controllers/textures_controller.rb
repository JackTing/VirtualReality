class TexturesController < ApplicationController
  before_action :set_texture, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!,:only =>[:show,:index,:edit,:new]
  # GET /textures#all
  # GET /textures.json
  def index
    @textures = Texture.order(:name).page params[:page]
  end

end
