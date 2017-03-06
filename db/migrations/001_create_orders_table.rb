
Sequel.migration do
  # INFO:
  # "change" can be used instead of "up" and "down"
  # if the migration is reversable
  change do
    create_table(:orders) do
      primary_key :id
      String :name, null: false
      Text :description
      Integer :age
      String :color
      DateTime :created_at, null: false
      DateTime :updated_at, null: false  # only works automatically if update_on_create is true
    end
  end
end