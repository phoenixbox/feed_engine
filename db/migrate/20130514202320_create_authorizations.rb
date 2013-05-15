class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :type
      t.string :token
      t.string :secret
      t.hstore :raw_info
      t.references :user

      t.timestamps
    end
    add_index :authorizations, :user_id
  end
end
