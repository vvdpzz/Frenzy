class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :user, :null => false
      t.string :title, :null => false
      t.text :content, :default => ""
      t.integer :credit, :default => 0
      t.decimal :money, :precision => 8, :scale => 2, :default => 0
      t.integer :answers_count, :default => 0
      t.integer :votes_count, :default => 0
      t.integer :correct_answer_id, :limit => 8, :default => 0

      t.timestamps
    end
    add_index :questions, :user_id
  end
end
