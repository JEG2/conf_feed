class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.belongs_to :talk, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.text       :body, null: false

      t.timestamps null: false
    end
  end
end
