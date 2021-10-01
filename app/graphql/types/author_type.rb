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
end