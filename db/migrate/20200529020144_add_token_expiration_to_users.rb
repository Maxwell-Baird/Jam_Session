# frozen_string_literal: true

class AddTokenExpirationToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :token_expiration, :integer
  end
end
