module Mutations::Companies
  class CreateCompany < Mutations::BaseMutation
    null true

    argument :name, String, required: true

    field :company, Types::CompanyType, null: true
    field :errors, [String],            null: false

    def resolve(name:)
      company = Company.create(name: name)
      if company.save
        { company: company, errors: [] }
      else
        { company: nil, errors: company.errors.full_messages }
      end
    end
  end
end
