class AddStateToTaggedusers < ActiveRecord::Migration
  def change
    add_column :taggedusers, :status, :string
  end
end
