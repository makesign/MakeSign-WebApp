class AddExpiryDateToSlideMappings < ActiveRecord::Migration[7.1]
  def change
    add_column :slide_mappings, :expiry_date, :string
  end
end
