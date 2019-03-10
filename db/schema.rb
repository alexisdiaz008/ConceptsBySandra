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

ActiveRecord::Schema.define(version: 2019_01_16_145055) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "aggregator_managers", id: :serial, force: :cascade do |t|
    t.jsonb "priorities", default: ""
    t.jsonb "opt_out", default: ""
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_aggregator_managers_on_company_id"
  end

  create_table "applicants", id: :serial, force: :cascade do |t|
    t.string "job_title"
    t.integer "company_id"
    t.jsonb "custom_fields", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "apply_url"
    t.string "ip_address"
    t.string "job_token"
    t.string "source"
    t.string "company_name"
    t.string "resume"
    t.string "client_reference_id", default: ""
    t.string "resume_url_string"
    t.integer "resume_upload_status", default: 0
    t.string "reference_id"
    t.integer "ats_upload_status", default: 0
    t.string "ats_error_message"
    t.index ["company_id"], name: "index_applicants_on_company_id"
  end

  create_table "companies", id: :serial, force: :cascade do |t|
    t.string "name", default: ""
    t.string "feed_source", default: ""
    t.boolean "is_active", default: false
    t.boolean "sanitize", default: false
    t.jsonb "custom_fields", default: "[{\"question\":\"First Name\"},{\"question\":\"Last Name\"},{\"question\":\"Email Address\"},{\"question\":\"Phone Number\"},{\"question\":\"City\"},{\"question\":\"State\"},{\"question\":\"Experience\",\"options\":[\"0-1 years\",\"1-3 years\",\"3-5 years\",\"5+ years\"]}]"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "logo"
    t.string "email_contacts", default: "{\"recipients\":[]}"
    t.string "feed_hash"
    t.boolean "resume_required", default: false
    t.boolean "show_resume", default: true
    t.index ["slug"], name: "index_companies_on_slug"
  end

  create_table "company_feed_rules", id: :serial, force: :cascade do |t|
    t.string "find_str"
    t.string "replace_str"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_feed_rules_on_company_id"
  end

  create_table "company_refresh_logs", id: :serial, force: :cascade do |t|
    t.jsonb "data", default: {}, null: false
    t.integer "company_id", null: false
    t.integer "refresh_log_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_company_refresh_logs_on_company_id"
    t.index ["refresh_log_id"], name: "index_company_refresh_logs_on_refresh_log_id"
  end

  create_table "email_subscribers", id: :serial, force: :cascade do |t|
    t.string "mailchimp_id"
    t.string "email_address"
    t.string "location_entered"
    t.boolean "active", default: true
    t.datetime "last_sent", default: "2019-01-03 14:34:51"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "applicant_id"
    t.index ["applicant_id"], name: "index_email_subscribers_on_applicant_id"
  end

  create_table "friendly_id_slugs", id: :serial, force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

# Could not dump table "jobs" because of following StandardError
#   Unknown type 'geography(Point,4326)' for column 'lonlat'

# Could not dump table "locations" because of following StandardError
#   Unknown type 'geography(Point,4326)' for column 'lonlat'

  create_table "refresh_logs", id: :serial, force: :cascade do |t|
    t.jsonb "data", default: {}, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spatial_ref_sys", primary_key: "srid", id: :integer, default: nil, force: :cascade do |t|
    t.string "auth_name", limit: 256
    t.integer "auth_srid"
    t.string "srtext", limit: 2048
    t.string "proj4text", limit: 2048
  end

  create_table "templates", id: :serial, force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "phone"
    t.string "education"
    t.string "salary"
    t.string "category"
    t.string "experience"
    t.string "apply_url"
    t.integer "company_id"
    t.string "referrer"
    t.string "internal_id"
    t.string "position"
    t.string "work_type"
    t.string "regions"
    t.boolean "is_active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_templates_on_company_id"
  end

  create_table "tokens", id: :serial, force: :cascade do |t|
    t.string "key", default: ""
    t.integer "job_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_tokens_on_job_id"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "access_level", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "aggregator_managers", "companies"
  add_foreign_key "applicants", "companies"
  add_foreign_key "company_feed_rules", "companies"
  add_foreign_key "email_subscribers", "applicants"
  add_foreign_key "jobs", "companies"
  add_foreign_key "jobs", "locations"
  add_foreign_key "jobs", "templates"
  add_foreign_key "templates", "companies"
  add_foreign_key "tokens", "jobs"
end
