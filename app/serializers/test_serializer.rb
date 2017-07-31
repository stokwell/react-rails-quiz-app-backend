class TestSerializer < ActiveModel::Serializer
  attributes :id, :title, :category, :description
  has_many :questions, serializer: QuestionSerializer

end
