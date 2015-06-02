class CreateGitCaches < ActiveRecord::Migration
  def change
    create_table :git_caches do |t|
      t.string :repo_identifier
      t.text   :command, :text
      t.binary :command_output, limit: 16777216

      t.timestamps null: false
    end
  end
end
