require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @content = FactoryBot.build(:content)
  end

  describe '商品の出品' do
    context '商品の出品ができる場合' do
      it '全て存在すれば出品できる' do
        expect(@content).to be_valid
      end
    end

    context '商品の出品ができない場合' do
      it 'image:必須' do
        @content.image = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Image can't be blank")
      end
      it 'title:必須' do
        @content.title = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Title can't be blank")
      end
      it 'explanation:必須' do
        @content.explanation = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category:必須' do
        @content.category_id = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Category can't be blank")
      end
      it 'state:必須' do
        @content.state_id = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("State can't be blank")
      end
      it 'charge:必須' do
        @content.charge_id = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Charge can't be blank")
      end
      it 'area:必須' do
        @content.area_id = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Area can't be blank")
      end
      it 'days:必須' do
        @content.days_id = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Days can't be blank")
      end
      it 'price:必須' do
        @content.price = ''
        @content.valid?
        expect(@content.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は¥300~¥9,999,999の間のみ保存可能' do
        @content.price = '299', '10000000'
        @content.valid?
        expect(@content.errors.full_messages).to include("Price can't be blank")
      end
      it '価格は半角数値のみ保存可能' do
        @content.price = '１234'
        @content.valid?
        expect(@content.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end
