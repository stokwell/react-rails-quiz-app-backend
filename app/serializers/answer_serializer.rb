class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :body, :comment, :right
end
