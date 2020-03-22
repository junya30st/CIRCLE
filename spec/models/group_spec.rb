require 'rails_helper'

describe Group do
  describe '#create' do

    it 'nameが空欄だと投稿できない' do
      group = build(:group, name: "")
      group.valid?
      expect(group.errors[:name]).to include("can't be blank")
    end

  end
end