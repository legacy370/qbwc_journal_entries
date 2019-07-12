class AddIsActiveToQbCoa < ActiveRecord::Migration[5.2]
  def change
    add_column :qb_coas, :is_active, :boolean
  end
end
