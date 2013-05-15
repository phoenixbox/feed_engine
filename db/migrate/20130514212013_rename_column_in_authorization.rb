class RenameColumnInAuthorization < ActiveRecord::Migration
  def up
    rename_column :authorizations, :type, :service_provider
  end

  def down
    rename_column :authorizations, :service_provider, :type
  end
end
