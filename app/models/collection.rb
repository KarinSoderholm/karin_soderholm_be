class Collection < ApplicationRecord
  has_many :artwork_collections
  has_many :artworks, through: :artwork_collections
  has_many :object_collections
  has_many :clothings, through: :object_collections

  validates :name, presence: true

  # enum collection_type: { art: 'art', object: 'object' }, _prefix: :collection_type
  enum collection_type: { art: 'art', object: 'object' }

  def self.find_artworks
    where(collection_type: 'art')
  end

  def self.find_objects
    where(collection_type: 'object')
  end

  def self.find_object_collection(object)
    object.collections.first.collection_type
  end
end
