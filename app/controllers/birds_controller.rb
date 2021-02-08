class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, only: [:id, :name, :species]
    # alt ==> render json: birds, except: [:created_at, :updated_at]
    # does the same as above:
    #render json: birds.to_json(except: [:created_at, :updated_at])

    #error handling
    if bird
      render json: { id: bird.id, name: bird.name, species: bird.species }
    else
      render json: { message: 'Bird not found' }
    end
  end

  def show
    bird = Bird.find_by(id: params[:id])
    render json: {id: bird.id, name: bird.name, species: bird.species}
    #alternative ==> bird.slice(:id, :name, :species)
  end
end