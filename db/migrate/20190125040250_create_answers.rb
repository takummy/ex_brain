class CreateAnswers < ActiveRecord::Migration[5.2]
  def up
    create_table :answers do |t|
      t.references :question, foreign_key: true
      t.string :content, null: false, default: "", limit: 255
      t.boolean :correct, null: false, default: ""

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end
