# frozen_string_literal: true

class CreateStudySessions < ActiveRecord::Migration[5.2]
  def change
    create_table :study_sessions do |t|
      t.integer :duration
      t.string :topic
      t.boolean :paired
      t.references :user, foreign_key: true
    end
  end
end
