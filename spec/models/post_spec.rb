require 'rails_helper'

describe Post do
  describe '#create' do
    context 'can save' do

      it 'titleとtext両方あれば投稿できる' do
        post = build(:post)
        expect(post).to be_valid
      end

    end

    context 'can not save' do

      it 'titleが空欄だと投稿できない' do
        post = build(:post, title: "")
        post.valid?
        expect(post.errors[:title]).to include("can't be blank")
      end

      it 'textが空欄だと投稿できない' do
        post = build(:post, text: "")
        post.valid?
        expect(post.errors[:text]).to include("can't be blank")
      end

    end
  end
end