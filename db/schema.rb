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

ActiveRecord::Schema.define(version: 20140618030317) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "infos", force: true do |t|
    t.string   "key"
    t.text     "value"
    t.integer  "unity3d_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  add_index "infos", ["unity3d_id"], name: "index_infos_on_unity3d_id"

  create_table "layer_unity3ds", force: true do |t|
    t.integer  "layer_id"
    t.integer  "unity3d_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "layers", force: true do |t|
    t.string   "name"
    t.text     "objectname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_category_model_libs", force: true do |t|
    t.integer  "model_category_id"
    t.integer  "model_lib_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "model_libs", force: true do |t|
    t.string   "name"
    t.string   "source"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "plan_projects", force: true do |t|
    t.integer  "plan_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plan_unity3ds", force: true do |t|
    t.integer  "plan_id"
    t.integer  "unity3d_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plans", force: true do |t|
    t.string   "wbsno"
    t.string   "wbsname"
    t.integer  "quantitiesplan"
    t.integer  "quantitiesfact"
    t.integer  "wbspctcomp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_unity3ds", force: true do |t|
    t.integer  "project_id"
    t.integer  "unity3d_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "sitemenus", force: true do |t|
    t.string   "name"
    t.integer  "custom_sort"
    t.text     "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "skies", force: true do |t|
    t.string   "name"
    t.string   "source"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sky_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sky_category_skies", force: true do |t|
    t.integer  "sky_id"
    t.integer  "sky_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submenus", force: true do |t|
    t.string   "name"
    t.text     "action"
    t.integer  "sitemenu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "custom_sort"
  end

  add_index "submenus", ["sitemenu_id"], name: "index_submenus_on_sitemenu_id"

  create_table "texture_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "texture_category_textures", force: true do |t|
    t.integer  "texture_category_id"
    t.integer  "texture_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "textures", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.integer  "texturecategory_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "textures", ["texturecategory_id"], name: "index_textures_on_texturecategory_id"

  create_table "unity3ds", force: true do |t|
    t.string   "name"
    t.string   "category"
    t.string   "objectname"
    t.string   "source"
    t.boolean  "use"
    t.text     "option"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "plan"
    t.integer  "num",        default: 0
  end

  add_index "unity3ds", ["name"], name: "index_unity3ds_on_name"

  create_table "user_projects", force: true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
