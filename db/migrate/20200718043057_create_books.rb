class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, length: {maximum:70}
      t.string :author
      t.integer :status
      t.date :date_out
      t.date :date_in
      t.timestamps
    end
  end
end
