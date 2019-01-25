class CreateLessonQuestions < ActiveRecord::Migration[5.2]
  def up
    create_table :lesson_questions do |t|
      t.references :lesson, foreign_key: true
      t.references :question, foreign_key: true
      t.references :answer, foreign_key: true

      t.timestamps
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not reversible."
  end
end
