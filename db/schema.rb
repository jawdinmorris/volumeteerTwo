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

ActiveRecord::Schema.define(version: 20_180_507_093_026) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'jobs', force: :cascade do |t|
    t.string 'name'
    t.string 'description'
    t.string 'street'
    t.string 'city'
    t.string 'country'
    t.integer 'postcode'
    t.string 'skills_needed'
    t.integer 'volunteers_needed'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.bigint 'user_id'
    t.float 'latitude'
    t.float 'longitude'
    t.index ['user_id'], name: 'index_jobs_on_user_id'
  end

  create_table 'jobs_users', id: false, force: :cascade do |t|
    t.bigint 'job_id', null: false
    t.bigint 'user_id', null: false
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name'
    t.string 'resource_type'
    t.bigint 'resource_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[name resource_type resource_id], name: 'index_roles_on_name_and_resource_type_and_resource_id'
    t.index ['name'], name: 'index_roles_on_name'
    t.index %w[resource_type resource_id], name: 'index_roles_on_resource_type_and_resource_id'
  end

  create_table 'skills', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'name'
  end

  create_table 'skills_users', id: false, force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'skill_id', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'first_name'
    t.string 'last_name'
    t.string 'business_name'
    t.string 'bio'
    t.integer 'phone'
    t.string 'street'
    t.string 'city'
    t.string 'country'
    t.integer 'postcode'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'chosen_role'
    t.string 'image'
    t.float 'latitude'
    t.float 'longitude'
    t.integer 'volunteer_cap'
    t.integer 'job_cap'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  create_table 'users_roles', id: false, force: :cascade do |t|
    t.bigint 'user_id'
    t.bigint 'role_id'
    t.index ['role_id'], name: 'index_users_roles_on_role_id'
    t.index %w[user_id role_id], name: 'index_users_roles_on_user_id_and_role_id'
    t.index ['user_id'], name: 'index_users_roles_on_user_id'
  end
end
