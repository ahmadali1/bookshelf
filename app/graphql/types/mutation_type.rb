class Types::MutationType < Types::BaseObject

  field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor
  field :update_author, Boolean, null: false, description: 'Updates the author' do
    argument :author, Types::AuthorInputType, required: true
  end

  def update_author(author:)
    _author = Author.where(id: author[:id]).last
    _author&.update(author.to_h)
  end

  field :delete_author, Boolean, null: false, description: 'deletes the author' do
    argument :id, ID, required: true
  end

  def delete_author(id:)
    _author = Author.where(id: id).destroy_all

    true
  end

end


# mutation updateAuthor($author:AuthorInputType!) {
#   updateAuthor(author: $author)
# }

# {
#   "author" : {
#     "id": 4,
#     "first_name": "First NameN",
#     "last_name": "Last Name"
#   }
# }

# mutation {
#   deleteAuthor(id: 4)
# }
