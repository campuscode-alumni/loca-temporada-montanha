class CreateProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :proposals do |t|
      t.date :start_date
      t.date :end_date
      t.decimal :total_amount
      t.integer :total_guests
      t.string :guest_name
      t.string :email
      t.string :phone
      t.decimal :rent_purpose
      t.boolean :pet
      t.boolean :smoker
      t.decimal :total_amount
      t.text :details
      t.references :property_id, foreign_key: true

      t.timestamps
    end
  end
end
