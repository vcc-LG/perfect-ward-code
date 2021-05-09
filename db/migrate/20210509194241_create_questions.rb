class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions, &:timestamps
  end
end
