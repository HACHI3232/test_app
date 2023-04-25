class TypingsController < ApplicationController
  def index
    @character = Character.find_by(id:1)

  end

  def edit
    @dictionaries = Post.all
    @character = Character.find_by(id:1)

  end


  def result
    @character = Character.find_by(id:1)

  end


end
