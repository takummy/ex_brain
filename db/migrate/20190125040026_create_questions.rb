class CreateQuestions < ActiveRecord::Migration[5.2]
  def up
    create_table :questions do |t|
      t.references :book, foreign_key: true
      t.string :content, null: false, default: "", limit: 255

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end
