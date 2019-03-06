class CreateBooks < ActiveRecord::Migration[5.2]
  def up
    create_table :books do |t|
      t.string :title, null: false, default: "", limit: 255
      t.string :description, null: false, default: "", limit: 255
      t.string :image

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end
