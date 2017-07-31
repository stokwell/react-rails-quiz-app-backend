class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :body, :test_id

  has_many :answers, serializer: AnswerSerializer

end
