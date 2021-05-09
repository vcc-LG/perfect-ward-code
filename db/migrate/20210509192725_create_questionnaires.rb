class CreateQuestionnaires < ActiveRecord::Migration[6.1]
  def change
    create_table :questionnaires, &:timestamps
  end
end
