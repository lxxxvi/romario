Hanami::Model.migration do
  change do
    create_table :venues do
      primary_key :id

      column :what3words  , String  , null: false, unique: true
      column :name        , String  , null: false, unique: true
      column :city        , String  , null: false
      column :timezone    , String  , null: false
    end
  end
end
