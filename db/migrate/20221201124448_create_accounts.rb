class CreateAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :email
      t.string :mobile
      t.string :description

      t.timestamps
    end
  end
end