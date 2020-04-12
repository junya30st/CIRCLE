require 'rails_helper'

describe Group do
  describe '#create' do
    context 'can save' do
      it 'nameがあれば登録できる' do
        group = build(:group)
        expect(group).to be_valid
      end
    end

    context 'can not save' do
      it 'nameが空欄だと投稿できない' do
        group = build(:group, name: "")
        group.valid?
        expect(group.errors[:name]).to include("can't be blank")
      end
    end
  end
end