class CreateTalks < ActiveRecord::Migration
  def change
    create_table :talks do |t|
      t.belongs_to :conference, index: true, foreign_key: true
      t.string    :title,        null: false
      t.string    :speaker,      null: false
      t.timestamp :presented_at, null: false

      t.timestamps null: false
    end
  end
end
