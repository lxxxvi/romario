Hanami::Model.migration do
  change do
    create_table :groups do
      primary_key :id

      column :name    , String  , null: false, unique: true
    end
  end
end
