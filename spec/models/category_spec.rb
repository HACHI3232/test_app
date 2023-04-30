require 'rails_helper'

RSpec.describe Post, type: :model do
  describe '辞書の新規登録' do
    before do
      @category = FactoryBot.build(:category)
    end

    context '辞書が登録できること' do
      it '全ての項目の入力が存在すれば登録できること' do
        expect(@category).to be_valid
      end
      it '辞書の種類が空でなければ登録できること' do
        @category.name = "テスト"
        expect(@category).to be_valid
      end
    end
    context '単語・意味が登録できないこと' do
      it '辞書の種類が空では登録できない' do
        @category.name = ""
        @category.valid?
        expect(@category.errors.full_messages).to include "Name can't be blank"
      end
    end
  end
end
