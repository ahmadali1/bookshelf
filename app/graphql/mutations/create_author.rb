class Mutations::CreateAuthor < GraphQL::Schema::Mutation
  null true

  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false

  def resolve(first_name:, last_name:)
    Author.create(first_name: first_name, last_name: last_name)
  end
end


# Query Variables

# mutation createAuthor($f_name: String, $l_name: String) {
#   createAuthor(first_name: $f_name, last_name: $l_name) {
#     id
#     fullName
#   }
# }


# {
#   "f_name": "First Name",
#   "l_name": "Last Name"
# }