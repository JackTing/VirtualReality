class ModelLibsController < ApplicationController
  before_action :set_model_lib, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!,:only =>[:show,:index,:edit,:new]
  def index
    @model_libs = ModelLib.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @model_libs }
    end
  end
  def show
    @model_libs = ModelLib.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @model_libs }
    end
  end
end
