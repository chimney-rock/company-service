RSpec.describe Company, type: :model do
  context 'database structure' do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:external_id).of_type(:uuid) }
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
  end

  context 'validations' do
    it { should validate_presence_of(:name) }
  end
end
