class CharactersController < ApplicationController
  def show
    @character = Character.new(id: 1, name: "keybo", experience: 0)
    @character = Character.find_by(id: 1)
  end
  # def index
    
  # end
  # def create
  #   @character = Character.new(character_params)
  #   if @character.save
  #     redirect_to "/"
  #   end
  # end

  # private

  # def character_params
  #   params.require(:character).permit(:name, :level, :experience)
  # end
end
