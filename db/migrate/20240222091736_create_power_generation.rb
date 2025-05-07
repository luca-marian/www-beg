# frozen_string_literal: true

class CreatePowerGeneration < ActiveRecord::Migration[7.1]
  def change
    create_table :power_generation do |t|
      t.string :plant_name
      t.boolean :operational
      t.integer :capacity
      t.integer :production
      t.bigint :timestamp
    end

    ActiveRecord::Base.connection.execute('
      DO $$ BEGIN
        create type plant_json as (
          plant_name varchar,
          operational boolean,
          capacity integer,
          production integer,
          timestamp bigint
        );
      EXCEPTION
          WHEN duplicate_object THEN null;
      END $$;
      create view current_power_generation as select distinct on (plant_name) * from power_generation order by plant_name,timestamp desc;
    ')
  end
end
