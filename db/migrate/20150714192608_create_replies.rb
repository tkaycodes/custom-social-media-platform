class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :name
      t.references :message, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
