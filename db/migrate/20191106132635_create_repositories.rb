class CreateRepositories < ActiveRecord::Migration[5.2]
  def change
    create_table :repositories do |t|
      t.references :owner, foreign_key: true
      t.string  :full_name
      t.string  :url
      t.string  :language
      t.string  :default_branch
      t.string  :git_url
      t.string  :ssh_url
      t.string  :clone_url
      t.string  :svn_url
      t.string  :home

      t.integer :size
      t.integer :stars_count
      t.integer :watchers_count
      t.integer :forks_count
      t.integer :open_issues_count
      t.integer :score
      t.integer :github_id

      t.boolean :has_issues
      t.boolean :has_projects
      t.boolean :has_downloads
      t.boolean :has_wiki
      t.boolean :has_pages
      t.boolean :archived
      t.boolean :disabled
      t.boolean :license
      t.boolean :private
      t.text    :description

      # data do repository
      t.date    :repository_date_create
      t.date    :repository_date_update

      t.timestamps
    end
  end
end
