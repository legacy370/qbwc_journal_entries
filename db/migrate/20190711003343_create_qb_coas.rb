class CreateQbCoas < ActiveRecord::Migration[5.2]
  def change
    create_table :qb_coas do |t|
      t.string :qb_list_id
      t.string :edit_sequence
      t.string :name
      t.string :full_name
      t.string :account_type

      t.timestamps
    end
  end
end
