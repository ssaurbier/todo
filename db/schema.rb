ActiveRecord::Schema.define(version: 20151006181715) do
  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.integer "list_id",  null: false
    t.integer "user_id",  null: false
    t.string  "due_date"
    t.string  "name",     null: false
  end

  create_table "lists", force: :cascade do |t|
    t.integer "user_id",  null: false
    t.string  "title",    null: false
    t.string  "due_date"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "phone_number",                        null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
