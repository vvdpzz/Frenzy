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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110929015936) do

  create_table "answers", :force => true do |t|
    t.integer  "user_id",                        :null => false
    t.integer  "question_id",                    :null => false
    t.text     "content",                        :null => false
    t.boolean  "is_correct",  :default => false
    t.integer  "votes_count", :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["question_id"], :name => "index_answers_on_question_id"
  add_index "answers", ["user_id"], :name => "index_answers_on_user_id"

  create_table "questions", :force => true do |t|
    t.integer  "user_id",                                                                       :null => false
    t.string   "title",                                                                         :null => false
    t.text     "content"
    t.integer  "credit",                                                       :default => 0
    t.decimal  "money",                          :precision => 8, :scale => 2, :default => 0.0
    t.integer  "answers_count",                                                :default => 0
    t.integer  "votes_count",                                                  :default => 0
    t.integer  "correct_answer_id", :limit => 8,                               :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "questions", ["user_id"], :name => "index_questions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username",                                                                             :null => false
    t.string   "email",                                                               :default => "",  :null => false
    t.string   "encrypted_password",     :limit => 128,                               :default => "",  :null => false
    t.string   "about_me",                                                            :default => ""
    t.integer  "questions_count",                                                     :default => 0
    t.integer  "answers_count",                                                       :default => 0
    t.integer  "votes_count",                                                         :default => 0
    t.integer  "credit",                                                              :default => 0
    t.decimal  "money",                                 :precision => 8, :scale => 2, :default => 0.0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

  create_table "votes", :force => true do |t|
    t.boolean  "vote",          :default => false
    t.integer  "voteable_id",                      :null => false
    t.string   "voteable_type",                    :null => false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], :name => "index_votes_on_voteable_id_and_voteable_type"
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], :name => "fk_one_vote_per_user_per_entity", :unique => true
  add_index "votes", ["voter_id", "voter_type"], :name => "index_votes_on_voter_id_and_voter_type"

end
