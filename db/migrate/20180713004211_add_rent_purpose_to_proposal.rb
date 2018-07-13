class AddRentPurposeToProposal < ActiveRecord::Migration[5.2]
  def change
    add_column :proposals, :rent_purpose, :text
  end
end
