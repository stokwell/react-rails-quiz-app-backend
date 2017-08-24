class TestSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :description, :cover
  has_many :questions, serializer: QuestionSerializer


end
