class CreateGithubComments < ActiveRecord::Migration
  def change
    create_table :github_comments do |t|
      t.integer :github_id
      t.integer :journal_id
    end

    add_index :github_comments, [ :github_id, :journal_id ], unique: true
  end
end
