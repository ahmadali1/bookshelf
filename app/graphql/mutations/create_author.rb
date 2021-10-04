class Mutations::CreateAuthor < GraphQL::Schema::Mutation
  null true

  argument :author, Types::AuthorInputType, required: true

  def resolve(author:)
    Author.create(author.to_h)
  end
end


# Query Variables

# mutation createAuthor($author:AuthorInputType!) {
#   createAuthor(author: $author) {
#     id
#     fullName
#   }
# }


# {
#   "author" : {
#     "first_name": "First Name",
#     "last_name": "Last Name"
#   }
# }