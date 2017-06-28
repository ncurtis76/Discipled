class LightsController < ApplicationController
  before_action :set_light, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /lights
  # GET /lights.json
  def index
    @lights = Light.all
  end

  # GET /lights/1
  # GET /lights/1.json
  def show
  end

  # GET /lights/new
  def new
    @light = current_user.lights.build

  end

  # GET /lights/1/edit
  def edit
  end

  # POST /lights
  # POST /lights.json
  def create
    @light = current_user.lights.build (light_params)

    respond_to do |format|
      if @light.save
        format.html { redirect_to @light, notice: 'Light was successfully created.' }
        format.json { render :show, status: :created, location: @light }
      else
        format.html { render :new }
        format.json { render json: @light.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lights/1
  # PATCH/PUT /lights/1.json
  def update
    respond_to do |format|
      if @light.update(light_params)
        format.html { redirect_to @light, notice: 'Light was successfully updated.' }
        format.json { render :show, status: :ok, location: @light }
      else
        format.html { render :edit }
        format.json { render json: @light.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lights/1
  # DELETE /lights/1.json
  def destroy
    @light.destroy
    respond_to do |format|
      format.html { redirect_to lights_url, notice: 'Light was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_light
      @light = Light.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def light_params
      params.require(:light).permit(:description)
    end
  def correct_user
    @light = current_user.lights.find_by(id: params[:id])
    redirect_to lights_path, notice: "Not authorised to edit this light" if @light.nil?
  end


end
