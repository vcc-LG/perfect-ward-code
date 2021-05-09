class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers, &:timestamps
  end
end
