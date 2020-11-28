class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :weight, :height, :id, :meals, :goal
end
