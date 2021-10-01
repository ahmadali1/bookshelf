class Types::QueryType < Types::BaseObject
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :test_field, String, null: false, description: "This is the description of test_field" do
    argument :name, String, required: true
  end

  def test_field(name:)
    "Hello #{name}"
  end

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
