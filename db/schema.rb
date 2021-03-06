# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121231040603) do

  create_table "info_nodes_ref_targets_items", :id => false, :force => true do |t|
    t.integer "info_node_src_id", :default => 0, :null => false
    t.integer "item_dest_id",     :default => 0, :null => false
  end

  add_index "info_nodes_ref_targets_items", ["info_node_src_id"], :name => "fk_info_nodes_ref_targets_items_sid"
  add_index "info_nodes_ref_targets_items", ["item_dest_id"], :name => "fk_info_nodes_ref_targets_items_did"

  create_table "items", :force => true do |t|
    t.string   "type",               :limit => 64
    t.string   "name",               :limit => 120
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_info_node_id"
    t.text     "body"
    t.string   "value",              :limit => 120
    t.integer  "sort_code"
    t.text     "view"
  end

  add_index "items", ["name"], :name => "item_name"
  add_index "items", ["owner_info_node_id"], :name => "fk_items_info_node_info_node_id"
  add_index "items", ["type"], :name => "item_type"

  create_table "properties", :force => true do |t|
    t.string  "name",         :limit => 120
    t.string  "value",        :limit => 120
    t.integer "item_item_id"
  end

  add_index "properties", ["item_item_id"], :name => "fk_properties_item_item_id"
  add_index "properties", ["name"], :name => "property_name"

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tags", :force => true do |t|
    t.string "name", :limit => 120
  end

  add_index "tags", ["name"], :name => "tag_name"

  create_table "tags_items_items", :id => false, :force => true do |t|
    t.integer "tag_src_id",   :default => 0, :null => false
    t.integer "item_dest_id", :default => 0, :null => false
  end

  add_index "tags_items_items", ["item_dest_id"], :name => "fk_tags_items_items_did"
  add_index "tags_items_items", ["tag_src_id"], :name => "fk_tags_items_items_sid"

end
