require 'rails_helper'

describe Message do
  describe '#create' do

    it 'contentが空欄だと投稿できない' do
      message = build(:message, content: "")
      message.valid?
      expect(message.errors[:content]).to include("can't be blank")
    end

    it 'user_idが空欄だと投稿できない' do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("can't be blank")
    end

    it 'group_idが空欄だと投稿できない' do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group_id]).to include("can't be blank")
    end

  end
end