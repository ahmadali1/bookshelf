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

    # here is how we rescue exceptions
    # Author.find('123456666')

    # rescue ActiveRecord::RecordNotFound => e
    # GraphQL::ExecutionError.new("Invalid input: #{e.to_s}")
  end

  field :login, String, null: true, description: 'Login as user' do
    argument :username, String, required: true
    argument :password, String, required: true
  end

  def login(username:, password:)
    # if User.find_by(username: username, password: password).present?
    #   # return some SESSION_key here
    # end

    Random.hex(20)
  end

  field :current_author, Types::AuthorType, null: true, description: 'Gives currently logged in Author'

  def current_author
    context[:current_author]
  end
end

# {
#   login(username: "ahmad.ali", password: "password")
# }

# {
#   currentAuthor {
#     id
#   }
# }