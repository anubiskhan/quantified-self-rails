
Types::FoodType = GraphQL::ObjectType.define do
  name 'Food'

  field :id, !types.ID
  field :name, !types.String
  field :calories, !types.Int
end
