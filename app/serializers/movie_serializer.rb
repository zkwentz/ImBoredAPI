class MovieSerializer < ActiveModel::Serializer
  attributes :id, :name, :url, :description, :why, :numofvisits, :photo, :notes, :hide
  has_one :city
end
