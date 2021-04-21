class RenameUserPassworkDigestToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passwork_digest, :password_digest
  end
end
