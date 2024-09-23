class CreateStructure < ActiveRecord::Migration[7.1]
  def change
    # Remove Active Storage table creation since rails active_storage:install creates them automatically
    # create_table "active_storage_attachments", force: :cascade do |t|
    #   t.string "name", null: false
    #   t.string "record_type", null: false
    #   t.bigint "record_id", null: false
    #   t.bigint "blob_id", null: false
    #   t.datetime "created_at", null: false
    #   t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    #   t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
    # end

    # create_table "active_storage_blobs", force: :cascade do |t|
    #   t.string "key", null: false
    #   t.string "filename", null: false
    #   t.string "content_type"
    #   t.text "metadata"
    #   t.string "service_name", null: false
    #   t.bigint "byte_size", null: false
    #   t.string "checksum"
    #   t.datetime "created_at", null: false
    #   t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
    # end

    # create_table "active_storage_variant_records", force: :cascade do |t|
    #   t.bigint "blob_id", null: false
    #   t.string "variation_digest", null: false
    #   t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
    # end

    # Other table creations remain unchanged
    create_table "screens", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "slide_mappings", force: :cascade do |t|
      t.integer "slideshow_id", null: false
      t.integer "slide_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "duration"
      t.index ["slide_id"], name: "index_slide_mappings_on_slide_id"
      t.index ["slideshow_id"], name: "index_slide_mappings_on_slideshow_id"
    end

    create_table "slides", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "slideshow_mappings", force: :cascade do |t|
      t.integer "screen_id", null: false
      t.integer "slideshow_id", null: false
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["screen_id"], name: "index_slideshow_mappings_on_screen_id"
      t.index ["slideshow_id"], name: "index_slideshow_mappings_on_slideshow_id"
    end

    create_table "slideshows", force: :cascade do |t|
      t.string "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    create_table "users", force: :cascade do |t|
      t.string "email"
      t.string "password_digest"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    # Keep the foreign key relationships for your custom tables
    add_foreign_key "slide_mappings", "slides"
    add_foreign_key "slide_mappings", "slideshows"
    add_foreign_key "slideshow_mappings", "screens"
    add_foreign_key "slideshow_mappings", "slideshows"
  end
end
