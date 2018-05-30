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

ActiveRecord::Schema.define(version: 20180528120353) do

  create_table "addresses", force: :cascade do |t|
    t.integer "user_id"
    t.string "postcode"
    t.string "prefecture"
    t.string "city"
    t.string "street"
    t.string "building"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "clinic_cards", force: :cascade do |t|
    t.integer "user_id"
    t.integer "clinic_id"
    t.integer "publisher_id"
    t.integer "holder_id"
    t.integer "holding_point", default: 0
    t.string "number", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_id"], name: "index_clinic_cards_on_clinic_id"
    t.index ["user_id"], name: "index_clinic_cards_on_user_id"
  end

  create_table "clinics", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", default: "", null: false
    t.string "hp_url", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clinics_on_user_id"
  end

  create_table "coupons", force: :cascade do |t|
    t.integer "user_id"
    t.integer "menu_id"
    t.integer "patients_receipt_id"
    t.integer "receipt_id"
    t.integer "seller_id"
    t.integer "buyer_id"
    t.string "name"
    t.integer "remaining"
    t.time "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_coupons_on_menu_id"
    t.index ["patients_receipt_id"], name: "index_coupons_on_patients_receipt_id"
    t.index ["receipt_id"], name: "index_coupons_on_receipt_id"
    t.index ["user_id"], name: "index_coupons_on_user_id"
  end

  create_table "follows", force: :cascade do |t|
    t.string "followable_type", null: false
    t.integer "followable_id", null: false
    t.string "follower_type", null: false
    t.integer "follower_id", null: false
    t.boolean "blocked", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["followable_id", "followable_type"], name: "fk_followables"
    t.index ["followable_type", "followable_id"], name: "index_follows_on_followable_type_and_followable_id"
    t.index ["follower_id", "follower_type"], name: "fk_follows"
    t.index ["follower_type", "follower_id"], name: "index_follows_on_follower_type_and_follower_id"
  end

  create_table "karte_menus", force: :cascade do |t|
    t.integer "medical_chart_id"
    t.string "course"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_chart_id"], name: "index_karte_menus_on_medical_chart_id"
  end

  create_table "medical_charts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "therapist_id"
    t.integer "patient_id"
    t.integer "card_number"
    t.date "visited_at"
    t.string "service"
    t.string "staff_name"
    t.text "cc"
    t.text "tx_comment"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_medical_charts_on_user_id"
  end

  create_table "menus", force: :cascade do |t|
    t.integer "user_id"
    t.integer "receipt_id"
    t.integer "content_id"
    t.string "content_name"
    t.integer "price"
    t.integer "attached_point"
    t.boolean "coupon", default: false
    t.integer "counting"
    t.integer "validity_period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["receipt_id"], name: "index_menus_on_receipt_id"
    t.index ["user_id"], name: "index_menus_on_user_id"
  end

  create_table "notices", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "title", null: false
    t.text "body"
    t.date "released_at", null: false
    t.date "expired_at"
    t.string "status", default: "draft", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_notices_on_user_id"
  end

  create_table "patients_receipts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "clinic_card_id"
    t.integer "seller_id"
    t.integer "buyer_id"
    t.date "payday"
    t.string "payer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_card_id"], name: "index_patients_receipts_on_clinic_card_id"
    t.index ["user_id"], name: "index_patients_receipts_on_user_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.integer "patients_receipt_id"
    t.string "service"
    t.integer "payment"
    t.integer "gained_point"
    t.integer "payment_method", limit: 3, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patients_receipt_id"], name: "index_receipts_on_patients_receipt_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "user_id"
    t.integer "medical_chart_id"
    t.integer "staff_number", null: false
    t.string "staff_name", null: false
    t.boolean "staff_suspension", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_chart_id"], name: "index_staffs_on_medical_chart_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "practice", default: false, null: false
    t.string "last_name", null: false
    t.string "first_name", default: "", null: false
    t.string "phone"
    t.date "birthday"
    t.integer "gender", default: 0, null: false
    t.boolean "account_suspension", default: false, null: false
    t.date "suspended_at"
    t.string "avatar"
    t.string "uid", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "username"
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
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
