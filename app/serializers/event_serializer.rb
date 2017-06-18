class EventSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :cover
end
