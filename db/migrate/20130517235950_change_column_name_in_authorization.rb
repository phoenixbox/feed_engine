class ChangeColumnNameInAuthorization < ActiveRecord::Migration
  def change
    rename_column :authorizations, :provider, :type
  end
end
