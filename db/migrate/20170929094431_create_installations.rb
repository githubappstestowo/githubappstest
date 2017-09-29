class CreateInstallations < ActiveRecord::Migration[5.0]
  def change
    create_table :installations do |t|
      t.string :uuid
      t.integer :user_id

      t.timestamps
    end
  end
end
