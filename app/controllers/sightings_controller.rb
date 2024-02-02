class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings
  end
  def show
    sighting = Sighting.find(params[:id])
    render json: sighting
  end
  def create
    sighting = Sighting.create(sighting_params)
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
    end
  end
  def update
    sighting = Sighting.find(params[:id])
    sighting.update(sighting_params)
    if sighting.valid?
      render json: sighting
    else
      render json: sighting.errors
    end
  end
  def destroy
    sighting = Sighting.find(params[:id])
    if sighting.destroy
      render json: sighting
    else
      render json: sighting.errors
    end
  end
  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting.to_json(include: [:animal, :sighting])
    else
      render json: { message: 'No sighting found with that id' }
    end
  end
  private
  def sighting_params
    params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date)
  end
end
