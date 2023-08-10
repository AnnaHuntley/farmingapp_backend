class CropsController < ApplicationController
 
  def index   #Fetches all crops from the database  
    @crops = Crop.all

    respond_to do |format|
      format.html # Render HTML view 
      format.json { render json: @crops } # Render JSON response
    end
  end

  def show  #Finds a specific crop by its ID
    @crop = Crop.find(params[:id])

    respond_to do |format|
      format.html # Render HTML view
      format.json { render json: @crop } # Render JSON response
    end
  end

  def new # Creates a new crop instance for the "new" form
    @crop = Crop.new
  end

  def create # Attempts to save a new crop. If successful, redirects to the crop's page and responds with JSON. If unsuccessful, renders the "new" form with errors and responds with JSON containing errors
    @crop = Crop.new(crop_params)
  
    if @crop.save # saves changes to a ecord in the database
      respond_to do |format|
        format.html { redirect_to @crop }
        format.json { render json: @crop, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @crop.errors, status: :unprocessable_entity }
      end
    end
  end
  

  def edit # Retrieves a crop for editing
    @crop = Crop.find(params[:id])
  end

  def update # Updates a crop's details. If successful, redirects to the crop's page and responds with JSON. If unsuccessful, renders the "edit" form with errors and responds with JSON containing errors
    @crop = Crop.find(params[:id])

    if @crop.update(crop_params)
      puts "Crop successfully updated: #{@crop}"
      respond_to do |format|
        format.html { redirect_to @crop }
        format.json { render json: @crop }
      end
    else
      puts "Error updating crop: #{@crop.errors}"
      respond_to do |format|
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crop.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy #  Deletes a crop. Redirects to the root path and responds with JSON indicating no content
    @crop = Crop.find(params[:id])
    @crop.destroy

    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private

  def crop_params
    params.require(:crop).permit(:name, :description, :quantity)
  end
end
