class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :questionnaires do |t|
      t.string :title

      t.timestamps
    end

    create_table :questions do |t|
      t.string :text

      t.timestamps
    end

    create_table :candidates do |t|
      t.string :name

      t.timestamps
    end

    create_table :responses do |t|
      t.boolean :value

      t.references :section
      t.references :candidate

      t.timestamps
    end

    create_table :sections do |t|
      t.references :question, null: false, foreign_key: true
      t.references :questionnaire, null: false, foreign_key: true

      t.timestamps
    end
  end
end
