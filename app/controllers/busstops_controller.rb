class BusstopsController < ApplicationController
  before_action :set_busstop, only: [:show, :edit, :update, :destroy]

  # GET /busstops
  # GET /busstops.json
  def index
    @busstops = Busstop.all
  end

  # GET /busstops/1
  # GET /busstops/1.json
  def show
  end

  # GET /busstops/new
  def new
    @busstop = Busstop.new
  end

  # GET /busstops/1/edit
  def edit
  end

  # POST /busstops
  # POST /busstops.json
  def create
    @busstop = Busstop.new(busstop_params)

    respond_to do |format|
      if @busstop.save
        format.html { redirect_to @busstop, notice: 'Busstop was successfully created.' }
        format.json { render :show, status: :created, location: @busstop }
      else
        format.html { render :new }
        format.json { render json: @busstop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /busstops/1
  # PATCH/PUT /busstops/1.json
  def update
    respond_to do |format|
      if @busstop.update(busstop_params)
        format.html { redirect_to @busstop, notice: 'Busstop was successfully updated.' }
        format.json { render :show, status: :ok, location: @busstop }
      else
        format.html { render :edit }
        format.json { render json: @busstop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /busstops/1
  # DELETE /busstops/1.json
  def destroy
    @busstop.destroy
    respond_to do |format|
      format.html { redirect_to busstops_url, notice: 'Busstop was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_busstop
      @busstop = Busstop.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def busstop_params
      params.require(:busstop).permit(:name, :latitude, :longitude)
    end
end
