class Types::QueryType < Types::BaseObject
  field :author, Types::AuthorType, null: true, description: 'Get an author details' do
    argument :id, ID, required: true
  end

  def author(id:)
    Author.where(id: id).first
  end

  field :authors, [Types::AuthorType], null: true, description: 'Returns all authors'

  def authors
    Author.all
  end
end
