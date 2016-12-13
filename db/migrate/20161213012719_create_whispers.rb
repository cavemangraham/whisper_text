class CreateWhispers < ActiveRecord::Migration[5.0]
  def change
    create_table :whispers do |t|
      t.string :recipient
      t.text :message

      t.timestamps
    end
  end
end
