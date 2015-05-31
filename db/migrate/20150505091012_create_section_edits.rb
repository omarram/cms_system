class CreateSectionEdits < ActiveRecord::Migration
  def change
    create_table :section_edits do |t|
      #t.integer "admin_user_id"
      #t.references "admin_user"
      t.references :admin_user
      #t.integer "section_id"
      #t.references "section"
      t.references :section
      t.string :summary

      t.timestamps null: false
    end
    add_index(:section_edits, ["admin_user_id", "section_id"])
  end
end
