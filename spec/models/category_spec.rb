require 'rails_helper'

describe Category do
  describe '#create' do
    context 'can save' do
      it 'nameがあれば登録できる' do
        category = build(:category)
        expect(category).to be_valid
      end
    end

    context 'can not save' do

      it 'nameが空欄だと登録できない' do
        category = build(:category, name: "")
        category.valid?
        expect(category.errors[:name]).to include("can't be blank")
      end
    end
  end
end