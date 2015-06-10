class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :daily_note_id
      t.string :text
      t.string :day

      t.timestamps

    end
  end
end
