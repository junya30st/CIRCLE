require 'rails_helper'

describe Relationship do
  describe '#create' do
    # context 'can save' do

    #   it 'user_idとfollow_idがあれば登録できる' do
    #     relationship = build(:relationship, user_id: follower, follow_id: followed)
    #     expect(relationship).to be_valid
    #   end

    # end

    context 'can not save' do

      it 'user_idが空欄だと投稿できない' do
        relationship = build(:relationship, user_id: "")
        relationship.valid?
        expect(relationship.errors[:user_id]).to include("can't be blank")
      end
    
      it 'follow_idが空欄だと投稿できない' do
        relationship = build(:relationship, follow_id: "")
        relationship.valid?
        expect(relationship.errors[:follow_id]).to include("can't be blank")
      end

    end
  end
end