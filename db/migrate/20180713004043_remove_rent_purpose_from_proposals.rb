class RemoveRentPurposeFromProposals < ActiveRecord::Migration[5.2]
  def change
    remove_column :proposals, :rent_purpose, :string
  end
end
