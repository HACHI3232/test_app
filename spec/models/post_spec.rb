require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '単語・意味新規登録' do
    before do
      @category = FactoryBot.create(:category, id:1)
      @post = FactoryBot.create(:post, category_id: @category.id)
    end

    context '単語・意味が登録できること' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@post).to be_valid
      end
      it 'カテゴリーが「辞書を選択して下さい」以外であれば登録できること' do
        @post.category_id = @category.id
        expect(@post).to be_valid
      end
      it '単語が空でなければ登録できること' do
        @post.word = "テスト"
        expect(@post).to be_valid
      end
      it '意味が空でなければ登録できること' do
        @post.mean = "検査"
        expect(@post).to be_valid
      end
    end

    context '単語・意味が登録できないこと' do
      it 'category_idが空では登録できない' do
        @post.category = nil
        @post.valid?
        expect(@post.errors.full_messages).to include "Category must exist"
      end
      it 'wordが空では登録できない' do
        @post.word = "" 
        @post.valid?
        expect(@post.errors.full_messages).to include "Word can't be blank"
      end
      it 'meanが空では登録できない' do
        @post.mean = "" 
        @post.valid?
        expect(@post.errors.full_messages).to include "Mean can't be blank"
      end
    end
  end
end
