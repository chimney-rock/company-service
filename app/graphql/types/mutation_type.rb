module Types
  class MutationType < GraphQL::Schema::Object
    field :create_company, mutation: Mutations::Companies::CreateCompany
  end
end
