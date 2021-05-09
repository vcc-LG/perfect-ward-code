class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses, &:timestamps
  end
end
