class ModelLibsController < ApplicationController
  before_action :set_model_lib, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!,:only =>[:show,:index,:edit,:new]
  def index
    @model_libs = ModelLib.order(:name).page params[:page]
  end
  def show
  end
  def all
    @layers=Layer.all
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_model_Lib
      @model_Lib = ModelLib.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def model_Lib_params
      params.require(:model_Lib).permit(:name)
    end
end
