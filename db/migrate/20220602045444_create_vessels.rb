class CreateVessels < ActiveRecord::Migration[7.0]
  def change
    create_table :vessels do |t|
      t.string :name, limit: 100
      t.string :company_id, limit: 30
      t.string :naccs_code, limit: 30, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
