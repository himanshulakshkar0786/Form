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

ActiveRecord::Schema.define(version: 20180202071357) do

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.integer "country_id"
    t.integer "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "post_id"
    t.integer "user_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", limit: 24, default: 0.0
    t.index ["cached_votes_down"], name: "index_comments_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_comments_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_comments_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_comments_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_comments_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_comments_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_comments_on_cached_weighted_total"
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "posts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "title"
    t.string "description"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "cached_votes_total", default: 0
    t.integer "cached_votes_score", default: 0
    t.integer "cached_votes_up", default: 0
    t.integer "cached_votes_down", default: 0
    t.integer "cached_weighted_score", default: 0
    t.integer "cached_weighted_total", default: 0
    t.float "cached_weighted_average", limit: 24, default: 0.0
    t.integer "category_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "audio_file_name"
    t.string "audio_content_type"
    t.integer "audio_file_size"
    t.datetime "audio_updated_at"
    t.string "video_file_name"
    t.string "video_content_type"
    t.integer "video_file_size"
    t.datetime "video_updated_at"
    t.index ["cached_votes_down"], name: "index_posts_on_cached_votes_down"
    t.index ["cached_votes_score"], name: "index_posts_on_cached_votes_score"
    t.index ["cached_votes_total"], name: "index_posts_on_cached_votes_total"
    t.index ["cached_votes_up"], name: "index_posts_on_cached_votes_up"
    t.index ["cached_weighted_average"], name: "index_posts_on_cached_weighted_average"
    t.index ["cached_weighted_score"], name: "index_posts_on_cached_weighted_score"
    t.index ["cached_weighted_total"], name: "index_posts_on_cached_weighted_total"
  end

  create_table "states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "name"
    t.string "username"
    t.date "date_of_birth"
    t.string "contact"
    t.integer "country_id"
    t.integer "state_id"
    t.integer "city_id"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.string "gender"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
