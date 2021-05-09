class AddValueToResponses < ActiveRecord::Migration[6.1]
  def change
    add_column :responses, :value, :bool
  end
end
