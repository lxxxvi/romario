Hanami::Model.migration do
  change do
    create_table :predictions do
      primary_key :id

      foreign_key :user_id      , :users      , on_delete: :cascade, null: false
      foreign_key :match_id     , :matches    , on_delete: :cascade, null: false

      column :predicted_left_team_score       , Integer, null: true
      column :predicted_right_team_score      , Integer, null: true

      column :points_left_team_score          , Integer, null: true
      column :points_right_team_score         , Integer, null: true
      column :points_overall_outcome          , Integer, null: true
      column :points_goal_difference          , Integer, null: true

      column :created_at                      , DateTime    , null: false
      column :updated_at                      , DateTime    , null: false
    end

    alter_table :predictions do
      add_unique_constraint [:user_id, :match_id]
    end
  end
end
