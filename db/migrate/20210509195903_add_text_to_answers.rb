class AddTextToAnswers < ActiveRecord::Migration[6.1]
  def change
    add_column :answers, :text, :string
  end
end
