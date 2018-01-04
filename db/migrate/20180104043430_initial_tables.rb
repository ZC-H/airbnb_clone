class InitialTables < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamps
    end
    create_table :listings do |t|
     	t.string :name
      t.belongs_to	:user
      t.timestamps
    end
    create_table :reservations do |t|
      t.belongs_to	:user
      t.belongs_to	:listing
      t.timestamps
    end
  end
end
