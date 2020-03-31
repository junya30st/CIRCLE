require 'rails_helper'

describe Message do
  describe '#create' do
    context 'can save' do

      it 'content, user_id, group_idがあれば登録できる' do
        message = build(:message)
        expect(message).to be_valid
      end
    end

    context 'can not save' do

      it 'contentが空欄だと投稿できない' do
        message = build(:message, content: "")
        message.valid?
        expect(message.errors[:content]).to include("can't be blank")
      end

    end
  end
end