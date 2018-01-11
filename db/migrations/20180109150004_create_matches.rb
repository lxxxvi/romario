Hanami::Model.migration do
  change do
    create_table :matches do
      primary_key :id

      foreign_key :venue_id       , :venues   , on_delete: :cascade, null: false
      foreign_key :left_team_id   , :teams    , on_delete: :cascade, null: false
      foreign_key :right_team_id  , :teams    , on_delete: :cascade, null: false

      column :phase             , String      , null: false
      column :left_team_score   , Integer     , null: true
      column :right_team_score  , Integer     , null: true
      column :kickoff_at        , DateTime    , null: false
      column :comments          , String      , null: true

      column :created_at        , DateTime    , null: false
      column :updated_at        , DateTime    , null: false
    end

    alter_table :matches do
      add_unique_constraint [:phase, :left_team_id, :right_team_id]
    end
  end
end
