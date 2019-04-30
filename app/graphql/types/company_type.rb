module Types
  class CompanyType < Types::BaseObject
    field :id,          Integer,  null: false
    field :external_id, UuidType, null: false
    field :name,        String,   null: false
  end
end
