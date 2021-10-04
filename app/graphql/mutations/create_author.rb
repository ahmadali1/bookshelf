class Mutations::CreateAuthor < GraphQL::Schema::Mutation
  null true

  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false

  def resolve(first_name:, last_name:)
    Author.create(first_name: first_name, last_name: last_name)
  end
end