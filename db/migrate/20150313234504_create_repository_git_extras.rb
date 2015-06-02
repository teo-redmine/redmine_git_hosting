class CreateRepositoryGitExtras < ActiveRecord::Migration
  def change
    create_table :repository_git_extras do |t|
      t.integer :repository_id
      t.string  :default_branch,   default: 'master'
      t.boolean :git_daemon,       default: true
      t.integer :git_http,         default: 1
      t.boolean :git_notify,       default: true
      t.boolean :git_annex,        default: false
      t.boolean :protected_branch, default: false
      t.boolean :public_repo,      default: false
      t.text    :urls_order
      t.string  :key
    end

    add_index :repository_git_extras, :repository_id, unique: true
  end
end
