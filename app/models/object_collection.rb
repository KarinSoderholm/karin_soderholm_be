class ObjectCollection < ApplicationRecord
  belongs_to :clothing, dependent: :destroy
  belongs_to :collection, dependent: :destroy
end
