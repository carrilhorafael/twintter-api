class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :nickname
      t.date :birthdate
      t.integer :gender
      t.string :contact_phone

      t.timestamps
    end
  end
end
