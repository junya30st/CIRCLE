class Message < ApplicationRecord

  belongs_to :user
  belongs_to :group


  after_create_commit {MessageBroadcastJob.perform_later self }

  validates :content, presence: true
  validates :user_id, presence: true
  validates :group_id, presence: true
end
