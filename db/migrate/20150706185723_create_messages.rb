class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :message
      t.string :sender_id
      t.string :recipient_id

      t.timestamps null: false
    end
  end
end
