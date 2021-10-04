class Types::AuthorInputType < GraphQL::Schema::InputObject
  graphql_name "AuthorInputType"
  description "All attributes for creating an author"

  argument :first_name, String, required: false, camelize: false
  argument :last_name, String, required: false, camelize: false
end

class Types::AuthorType < Types::BaseObject
  description 'This is an author'

  field :id, ID, null: false
  field :first_name, String, null: false
  field :last_name, String, null: false
  field :full_name, String, null: false
  field :full_name_full, String, null: false

  def full_name_full
    object.id.to_s + 'FULL'
  end

  field :location, Types::LocationType, null: false

  field :publication_years, [GraphQL::Types::ISO8601DateTime], null: false
end