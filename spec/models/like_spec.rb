require 'rails_helper'

describe Like do
  describe '#create' do
    context 'can save' do
      it 'user_idとpost_idがあれば登録できる' do
        like = build(:like)
        expect(like).to be_valid
      end
    end
  end
end
