class CharactersController < ApplicationController
  def index
    
  end
  def create
    @character = Character.new(character_params)
    if @character.save
      redirect_to "/"
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :level, :experience)
  end
end
