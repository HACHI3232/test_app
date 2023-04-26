class TypingsController < ApplicationController
  def index
    @character = Character.find_by(id: 1)
  end

  def edit
    @dictionaries = Post.all
    @character = Character.find_by(id: 1)
    @random_posts = Post.order("RAND()").limit(10)
  end

  def result
    @character = Character.find_by(id: 1)
    # 成功、失敗の数でキャラのレベルをアップデートする
    # params[:success], params[:failed] にはいってるよ
    # 成功と失敗がいくつずつだった時にレベルをいくつアップデートするかは決めてね
    # @character.update(level: xxx)

    @result = {
      success: params[:success],
      failed: params[:failed],
      character_level: @character.level,
    }
  end
end
