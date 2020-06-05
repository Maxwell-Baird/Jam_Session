# frozen_string_literal: true

class AddUidIndexToUser < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :uid, unique: true
  end
end
