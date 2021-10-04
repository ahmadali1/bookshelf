class Types::MutationType < Types::BaseObject

  field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

end
