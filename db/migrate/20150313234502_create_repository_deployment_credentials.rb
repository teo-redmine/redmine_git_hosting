class CreateRepositoryDeploymentCredentials < ActiveRecord::Migration
  def change
    create_table :repository_deployment_credentials do |t|
      t.integer :repository_id
      t.integer :gitolite_public_key_id
      t.integer :user_id
      t.boolean :active, default: true
      t.string  :perm
    end

    add_index :repository_deployment_credentials, :repository_id, name: 'index_deployment_credentials_on_repository_id'
    add_index :repository_deployment_credentials, [ :repository_id, :gitolite_public_key_id ], unique: true, name: 'index_deployment_credentials_on_repository_id_and_public_key_id'
  end
end
