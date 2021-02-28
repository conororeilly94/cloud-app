class AddCompantToProperties < ActiveRecord::Migration[6.1]
  def change
    add_column :properties, :company, :string
  end
end
