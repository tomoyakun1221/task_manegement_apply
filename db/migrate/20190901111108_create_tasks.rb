class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :task_name
      t.string :task_detail
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
