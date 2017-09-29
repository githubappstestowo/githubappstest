class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :login
      t.string :url
      t.string :uuid
      t.string :account_type

      t.timestamps
    end
  end
end
