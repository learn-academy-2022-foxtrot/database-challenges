 rails generate model Car brand:string model:string year:integer horsepower:integer


rails db:migrate
Car.create brand: "Mazda", model: "Miata", year: 1990, horsepower: 
110 -->
Car.create brand: "Mazda", model: "Mazda 3", year: 2010, horsepower
: 160
                  

 rails generate migration add_column_to_list

 class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :brand
      t.string :model
      t.integer :year
      t.integer :horsepower

      t.timestamps
    end
  end
end

class AddColumnToList < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :item, :string
    add_column :cars, :miles, :string
  end
end 

Class RenameColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars , :item, :specs
  end
end 

 ActiveRecord::Schema[7.0].define(version: 2022_10_06_213017) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cars", force: :cascade do |t|
    t.string "brand"
    t.string "model"
    t.integer "year"
    t.integer "horsepower"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specs"
    t.string "miles"
  end

  create_table "schedules", force: :cascade do |t|
    t.string "day"
    t.date "date"
    t.string "event"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

3.0.0 :001 > Car.all
  Car Load (1.0ms)  SELECT "cars".* FROM "cars"
 =>                                                        
[#<Car:0x000000013fcff5e0                                  
  id: 1,                                                   
  brand: "Mazda",                                          
  model: "Miata",                                          
  year: 1990,                                              
  horsepower: 110,                                         
  created_at: Thu, 06 Oct 2022 18:42:34.092680000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:42:34.092680000 UTC +00:00,
  item: nil,                                               
  miles: nil>,                                             
 #<Car:0x0000000118fe6f00                                  
  id: 2,                                                   
  brand: "Mazda",                                          
  model: "Mazda 3",
  year: 2010,
  horsepower: 160,
  created_at: Thu, 06 Oct 2022 18:43:47.680160000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:43:47.680160000 UTC +00:00,
  item: nil,
  miles: nil>,
 #<Car:0x0000000118fe6e38
  id: 3,
  brand: "Infiniti",
  model: "G35",
  year: 2003,
  horsepower: 280,
  created_at: Thu, 06 Oct 2022 18:56:48.129956000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:56:48.129956000 UTC +00:00,
  item: nil,
  miles: nil>,
 #<Car:0x0000000118fe6d70
  id: 4,
  brand: "Lamborghini",
  model: "Urus",
  year: 2023,
  horsepower: 608,
  created_at: Thu, 06 Oct 2022 18:58:35.472649000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:58:35.472649000 UTC +00:00,
  item: nil,
  miles: nil>,
 #<Car:0x0000000118fe6ca8
  id: 5,
  brand: "Audi",
  model: "A6",
  year: 2022,
  horsepower: 340,
  created_at: Thu, 06 Oct 2022 18:59:23.254460000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:59:23.254460000 UTC +00:00,
  item: nil,
  miles: nil>] 

  3.0.0 :001 > Car.all
  Car Load (0.5ms)  SELECT "cars".* FROM "cars"
 =>                                                        
[#<Car:0x00000001457f3b18                                  
  id: 1,                                                   
  brand: "Mazda",                                          
  model: "Miata",                                          
  year: 1990,                                              
  horsepower: 110,                                         
  created_at: Thu, 06 Oct 2022 18:42:34.092680000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:42:34.092680000 UTC +00:00,
  specs: nil,                                              
  miles: nil>,                                             
 #<Car:0x00000001241bd5f8                                  
  id: 2,                                                   
  brand: "Mazda",                                          
  model: "Mazda 3",
  year: 2010,
  horsepower: 160,
  created_at: Thu, 06 Oct 2022 18:43:47.680160000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:43:47.680160000 UTC +00:00,
  specs: nil,
  miles: nil>,
 #<Car:0x00000001241bd530
  id: 3,
  brand: "Infiniti",
  model: "G35",
  year: 2003,
  horsepower: 280,
  created_at: Thu, 06 Oct 2022 18:56:48.129956000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:56:48.129956000 UTC +00:00,
  specs: nil,
  miles: nil>,
 #<Car:0x00000001241bd440
  id: 4,
  brand: "Lamborghini",
  model: "Urus",
  year: 2023,
  horsepower: 608,
  created_at: Thu, 06 Oct 2022 18:58:35.472649000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:58:35.472649000 UTC +00:00,
  specs: nil,
  miles: nil>,
 #<Car:0x00000001241bd378
  id: 5,
  brand: "Audi",
  model: "A6",
  year: 2022,
  horsepower: 340,
  created_at: Thu, 06 Oct 2022 18:59:23.254460000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 18:59:23.254460000 UTC +00:00,
  specs: nil,
  miles: nil>

  specsNil =Car.where specs: nil 

  specsNil.update specs: 'test'

  3.0.0 :009 > specsNil.update specs: 'test'
  TRANSACTION (0.2ms)  BEGIN
  Car Update (0.9ms)  UPDATE "cars" SET "updated_at" = $1, "specs" = $2 WHERE "cars"."id" = $3  [["updated_at", "2022-10-06 21:42:33.162899"], ["specs", "test"], ["id", 1]]                                            
  TRANSACTION (1.3ms)  COMMIT                           
  TRANSACTION (0.3ms)  BEGIN                            
  Car Update (0.6ms)  UPDATE "cars" SET "updated_at" = $1, "specs" = $2 WHERE "cars"."id" = $3  [["updated_at", "2022-10-06 21:42:33.168086"], ["specs", "test"], ["id", 2]]                                            
  TRANSACTION (0.3ms)  COMMIT                           
  TRANSACTION (0.1ms)  BEGIN                            
  Car Update (0.3ms)  UPDATE "cars" SET "updated_at" = $1, "specs" = $2 WHERE "cars"."id" = $3  [["updated_at", "2022-10-06 21:42:33.171049"], ["specs", "test"], ["id", 3]]                                            
  TRANSACTION (0.3ms)  COMMIT                           
  TRANSACTION (0.1ms)  BEGIN
  Car Update (0.2ms)  UPDATE "cars" SET "updated_at" = $1, "specs" = $2 WHERE "cars"."id" = $3  [["updated_at", "2022-10-06 21:42:33.172871"], ["specs", "test"], ["id", 4]]
  TRANSACTION (0.3ms)  COMMIT
  TRANSACTION (0.1ms)  BEGIN
  Car Update (0.4ms)  UPDATE "cars" SET "updated_at" = $1, "specs" = $2 WHERE "cars"."id" = $3  [["updated_at", "2022-10-06 21:42:33.174990"], ["specs", "test"], ["id", 5]]
  TRANSACTION (0.2ms)  COMMIT
 => 
[#<Car:0x0000000103adfd28
  id: 1,
  brand: "Mazda",
  model: "Miata",
  year: 1990,
  horsepower: 110,
  created_at: Thu, 06 Oct 2022 18:42:34.092680000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:42:33.162899000 UTC +00:00,
  specs: "test",
  miles: nil>,
 #<Car:0x0000000103adfc38
  id: 2,
  brand: "Mazda",
  model: "Mazda 3",
  year: 2010,
  horsepower: 160,
  created_at: Thu, 06 Oct 2022 18:43:47.680160000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:42:33.168086000 UTC +00:00,
  specs: "test",
  miles: nil>,
 #<Car:0x0000000103adfb48
  id: 3,
  brand: "Infiniti",
  model: "G35",
  year: 2003,
  horsepower: 280,
  created_at: Thu, 06 Oct 2022 18:56:48.129956000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:42:33.171049000 UTC +00:00,
  specs: "test",
  miles: nil>,
 #<Car:0x0000000103adfa30
  id: 4,
  brand: "Lamborghini",
  model: "Urus",
  year: 2023,
  horsepower: 608,
  created_at: Thu, 06 Oct 2022 18:58:35.472649000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:42:33.172871000 UTC +00:00,
  specs: "test",
  miles: nil>,
 #<Car:0x0000000103adf940
  id: 5,
  brand: "Audi",
  model: "A6",
  year: 2022,
  horsepower: 340,
  created_at: Thu, 06 Oct 2022 18:59:23.254460000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:42:33.174990000 UTC +00:00,
  specs: "test",
  miles: nil>

  3.0.0 :010 > milesNil =Car.where miles: nil 
  3.0.0 :011 > milesNil.update miles: 20

[#<Car:0x0000000103cf5cc0
  id: 1,
  brand: "Mazda",
  model: "Miata",
  year: 1990,
  horsepower: 110,
  created_at: Thu, 06 Oct 2022 18:42:34.092680000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:44:58.896650000 UTC +00:00,
  specs: "test",
  miles: "20">,
 #<Car:0x0000000103cf5bf8
  id: 2,
  brand: "Mazda",
  model: "Mazda 3",
  year: 2010,
  horsepower: 160,
  created_at: Thu, 06 Oct 2022 18:43:47.680160000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:44:58.899637000 UTC +00:00,
  specs: "test",
  miles: "20">,
 #<Car:0x0000000103cf5b30
  id: 3,
  brand: "Infiniti",
  model: "G35",
  year: 2003,
  horsepower: 280,
  created_at: Thu, 06 Oct 2022 18:56:48.129956000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:44:58.903822000 UTC +00:00,
  specs: "test",
  miles: "20">,
 #<Car:0x0000000103cf5a68
  id: 4,
  brand: "Lamborghini",
  model: "Urus",
  year: 2023,
  horsepower: 608,
  created_at: Thu, 06 Oct 2022 18:58:35.472649000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:44:58.906527000 UTC +00:00,
  specs: "test",
  miles: "20">,
 #<Car:0x0000000103cf59a0
  id: 5,
  brand: "Audi",
  model: "A6",
  year: 2022,
  horsepower: 340,
  created_at: Thu, 06 Oct 2022 18:59:23.254460000 UTC +00:00,
  updated_at: Thu, 06 Oct 2022 21:44:58.908248000 UTC +00:00,
  specs: "test",
  miles: "20">] 