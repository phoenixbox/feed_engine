class ChangeTypeToProvider < ActiveRecord::Migration
  def change
    rename_column :authorizations, :type, :provider
  end
end
