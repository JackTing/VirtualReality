class SkiesController < ApplicationController
  def index
    @skies = Sky.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @skies }
    end
  end
  def show
    @sky = Sky.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sky }
    end
  end
end
