class TypingsController < ApplicationController
  def index
  end

  def edit
    @dictionaries = Post.all
  end


end
