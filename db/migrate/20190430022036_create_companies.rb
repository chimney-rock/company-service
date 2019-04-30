class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.uuid   :external_id, null: false, default: 'uuid_generate_v4()'
      t.string :name, null: false
      t.timestamps
    end
  end
end
