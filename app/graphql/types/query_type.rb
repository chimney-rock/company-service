module Types
  class QueryType < Types::BaseObject
    field :company, CompanyType, null: true do
      argument :id, Integer, required: true
    end

    # `company` resolver.
    #
    # @param [Integer] id Company Id.
    # @return [Company]
    # @raise [ActiveRecord::RecordNotFound]
    def company(id:)
      Company.find(id)
    end
  end
end
