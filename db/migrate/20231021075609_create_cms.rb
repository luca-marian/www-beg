# frozen_string_literal: true

class CreateCms < ActiveRecord::Migration[6.0]
  LIMIT = 16_777_215

  def change
    # -- Sites -----------------------------------------------------------------
    create_table :occams_cms_sites, force: true do |t|
      t.string :label,        null: false
      t.string :identifier,   null: false
      t.string :hostname,     null: false
      t.string :path
      t.string :locale, null: false, default: 'en'
      t.timestamps

      t.index :hostname
    end

    # -- Layouts ---------------------------------------------------------------
    create_table :occams_cms_layouts, force: true do |t|
      t.integer :site_id, null: false
      t.integer :parent_id
      t.string  :app_layout
      t.string  :label,       null: false
      t.string  :identifier,  null: false
      t.text    :content,     limit: LIMIT
      t.text    :css,         limit: LIMIT
      t.text    :js,          limit: LIMIT
      t.integer :position,    null: false, default: 0
      t.timestamps

      t.index %i[parent_id position]
      t.index %i[site_id identifier], unique: true
    end

    # -- Pages -----------------------------------------------------------------
    create_table :occams_cms_pages, force: true do |t|
      t.integer :site_id, null: false
      t.integer :layout_id
      t.integer :parent_id
      t.integer :target_page_id
      t.string  :label, null: false
      t.string  :slug
      t.string  :full_path,       null: false
      t.text    :content_cache,   limit: LIMIT
      t.integer :position,        null: false, default: 0
      t.integer :children_count,  null: false, default: 0
      t.boolean :is_published,    null: false, default: true
      t.timestamps

      t.index %i[site_id full_path]
      t.index %i[parent_id position]
      t.index [:is_published]
    end

    # -- Translations ----------------------------------------------------------
    create_table :occams_cms_translations, force: true do |t|
      t.string  :locale,    null: false
      t.integer :page_id,   null: false
      t.integer :layout_id
      t.string  :label,           null: false
      t.text    :content_cache,   limit: LIMIT
      t.boolean :is_published,    null: false, default: true
      t.timestamps

      t.index [:page_id]
      t.index [:locale]
      t.index [:is_published]
    end

    # -- Fragments -------------------------------------------------------------
    create_table :occams_cms_fragments, force: true do |t|
      t.references  :record,      polymorphic: true
      t.string      :identifier,  null: false
      t.string      :tag,         null: false, default: 'text'
      t.text        :content,     limit: LIMIT
      t.boolean     :boolean,     null: false, default: false
      t.datetime    :datetime
      t.timestamps

      t.index [:identifier]
      t.index [:datetime]
      t.index [:boolean]
    end

    # -- Snippets --------------------------------------------------------------
    create_table :occams_cms_snippets, force: true do |t|
      t.integer :site_id,     null: false
      t.string  :label,       null: false
      t.string  :identifier,  null: false
      t.boolean :markdown
      t.text    :content,     limit: LIMIT
      t.integer :position,    null: false, default: 0
      t.timestamps

      t.index %i[site_id identifier], unique: true
      t.index %i[site_id position]
    end

    # -- Files -----------------------------------------------------------------
    create_table :occams_cms_files, force: true do |t|
      t.integer :site_id,     null: false
      t.string  :label,       null: false, default: ''
      t.text    :description, limit: 2048
      t.integer :position,    null: false, default: 0
      t.timestamps

      t.index %i[site_id position]
    end

    # -- Revisions -------------------------------------------------------------
    create_table :occams_cms_revisions, force: true do |t|
      t.string    :record_type, null: false
      t.integer   :record_id,   null: false
      t.text      :data,        limit: LIMIT
      t.datetime  :created_at

      t.index %i[record_type record_id created_at],
              name: 'index_cms_revisions_on_rtype_and_rid_and_created_at'
    end

    # -- Categories ------------------------------------------------------------
    create_table :occams_cms_categories, force: true do |t|
      t.integer :site_id,          null: false
      t.string  :label,            null: false
      t.string  :categorized_type, null: false

      t.index %i[site_id categorized_type label],
              unique: true,
              name: 'index_cms_categories_on_site_id_and_cat_type_and_label'
    end

    create_table :occams_cms_categorizations, force: true do |t|
      t.integer :category_id,       null: false
      t.string  :categorized_type,  null: false
      t.integer :categorized_id,    null: false

      t.index %i[category_id categorized_type categorized_id],
              unique: true,
              name: 'index_cms_categorizations_on_cat_id_and_catd_type_and_catd_id'
    end
  end
end
