class CreateGitolitePublicKeys < ActiveRecord::Migration
  def change
    create_table :gitolite_public_keys do |t|
      t.integer :user_id
      t.integer :key_type, default: 0
      t.string  :title
      t.string  :identifier
      t.string  :fingerprint
      t.text    :key
      t.boolean :delete_when_unused, default: true

      t.timestamps null: false
    end

    add_index :gitolite_public_keys, :identifier
    add_index :gitolite_public_keys, :user_id
    add_index :gitolite_public_keys, :fingerprint, unique: true
    add_index :gitolite_public_keys, [ :title, :user_id ], unique: true
  end
end
