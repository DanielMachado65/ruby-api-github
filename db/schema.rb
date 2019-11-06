# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_06_132633) do

  create_table "owners", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "github_id"
    t.string "login"
    t.string "url"
    t.string "html_url"
    t.string "avatar_url"
    t.string "type"
    t.boolean "site_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repositories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "owner_id"
    t.string "full_name"
    t.string "url"
    t.string "language"
    t.string "default_branch"
    t.string "git_url"
    t.string "ssh_url"
    t.string "clone_url"
    t.string "svn_url"
    t.string "home"
    t.integer "size"
    t.integer "stars_count"
    t.integer "watchers_count"
    t.integer "forks_count"
    t.integer "open_issues_count"
    t.integer "score"
    t.integer "github_id"
    t.boolean "has_issues"
    t.boolean "has_projects"
    t.boolean "has_downloads"
    t.boolean "has_wiki"
    t.boolean "has_pages"
    t.boolean "archived"
    t.boolean "disabled"
    t.boolean "license"
    t.boolean "private"
    t.text "description"
    t.date "repository_date_create"
    t.date "repository_date_update"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_repositories_on_owner_id"
  end

  add_foreign_key "repositories", "owners"
end
