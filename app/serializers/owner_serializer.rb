class OwnerSerializer < ActiveModel::Serializer
  has_many :repository

  attributes :id
end
