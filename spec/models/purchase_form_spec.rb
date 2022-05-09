require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '配送先情報情報の保存' do
    context '保存ができる場合' do
      it '全て存在すれば保存できる' do
        expect(@purchase_form).to be_valid
      end
      it 'buildingは空でも保存できる' do
        @purchase_form.building = ''
        expect(@purchase_form).to be_valid
      end
      it "tokenがあれば保存ができること" do
        expect(@purchase_form).to be_valid
      end
    end

    context '保存ができない場合' do
      it 'postal_code:必須' do
        @purchase_form.postal_code = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @purchase_form.postal_code = '1234567'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Postal code is invalid")
      end
      it 'area:必須' do
        @purchase_form.area_id = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Area can't be blank")
      end
      it 'area:2以上のidが選択されないと保存できない' do
        @purchase_form.area_id = '1'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipality:必須' do
        @purchase_form.municipality = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'address:必須' do
        @purchase_form.address = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'telephone_number:必須' do
        @purchase_form.telephone_number = ''
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号は半角数値のみ保存できる' do
        @purchase_form.telephone_number = '１234'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号は9桁以下だと保存できない' do
        @purchase_form.telephone_number = '111111111'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it '電話番号は12桁以上だと保存できない' do
        @purchase_form.telephone_number = '111111111111'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it 'contentが紐付いていないと保存できないこと' do
        @purchase_form.user_id = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("User can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      
    end
  end
end