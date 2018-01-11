Hanami::Model.migration do
  change do
    create_table :teams do
      primary_key :id

      foreign_key :group_id, :groups, on_delete: :cascade, null: false

      column :fifa_country_code , String  , null: false, unique: true
      column :name              , String  , null: true
      column :group_order       , Integer , null: false
    end
  end
end
