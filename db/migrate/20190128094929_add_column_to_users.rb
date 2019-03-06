class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def up
    add_column :users, :name, :string, null: false, default: "", limit: 255
    add_column :users, :icon, :string
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end
