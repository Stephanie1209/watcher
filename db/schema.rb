# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160810191416) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.string   "name"
    t.integer  "repository_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "branches", ["repository_id"], name: "index_branches_on_repository_id", using: :btree

  create_table "commits", force: :cascade do |t|
    t.string   "sha"
    t.decimal  "total"
    t.decimal  "additions"
    t.decimal  "deletions"
    t.datetime "committed_at"
    t.integer  "branch_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "message"
    t.string   "author"
  end

  add_index "commits", ["branch_id"], name: "index_commits_on_branch_id", using: :btree

  create_table "issues", force: :cascade do |t|
    t.string   "github_account"
    t.string   "title"
    t.text     "description"
    t.string   "labels"
    t.string   "status"
    t.integer  "repository_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "github_number"
    t.string   "github_id"
    t.string   "assignee"
    t.string   "started_at"
  end

  add_index "issues", ["repository_id"], name: "index_issues_on_repository_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.string   "github_name"
    t.text     "description"
    t.string   "avatar"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pull_requests", force: :cascade do |t|
    t.string   "github_account"
    t.string   "title"
    t.string   "description"
    t.string   "labels"
    t.string   "status"
    t.integer  "repository_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "github_number"
    t.string   "github_id"
    t.string   "assignee"
    t.string   "started_at"
  end

  add_index "pull_requests", ["repository_id"], name: "index_pull_requests_on_repository_id", using: :btree

  create_table "repositories", force: :cascade do |t|
    t.string   "name"
    t.integer  "stars"
    t.integer  "forks_count"
    t.datetime "started_at"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "private"
  end

  add_index "repositories", ["organization_id"], name: "index_repositories_on_organization_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "branches", "repositories"
  add_foreign_key "commits", "branches"
  add_foreign_key "issues", "repositories"
  add_foreign_key "pull_requests", "repositories"
  add_foreign_key "repositories", "organizations"
end
