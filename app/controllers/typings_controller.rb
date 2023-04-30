class TypingsController < ApplicationController
  def index
    @character = Character.new(id: 1, name: "keybo", experience: 0)
    @character = Character.find_by(id: 1)
  end

  def edit
    @dictionaries = Post.all
    @character = Character.find_by(id: 1)
    # @random_posts = Post.order("RAND()").limit(10) #ローカル
    @random_posts = Post.order("RANDOM()").limit(10)

  end

  def result
    @character = Character.find_by(id: 1)
    @success = params[:success].to_i
    @character.update(experience: @character.experience + @success)
    if @character.experience >= 20
      @character.update(level: @character.level+5, experience: @character.experience - 20)
    end
    @result = {
      success: params[:success],
      failed: params[:failed],
      character_level: @character.level,
    }
  end
end
