class Contact < ApplicationRecord
  validates :name, presence: true
  validates :subject, presence: true
  validates :customer_email_address, presence: true
  validates :message, presence: true

  # enum message_status: { read: 'read', responded: 'responeded', follow_up: 'follow_up' }, _prefix: :message_status
  enum message_status: { unread: 'unread', read: 'read', responded: 'responeded', follow_up: 'follow_up' }, _prefix: :message_status
  # enum message_status: [:unread, :read, :responded, :follow_up]
end
