# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121217020539) do

  create_table "addendums", :force => true do |t|
    t.string   "fedexAddendumName"
    t.integer  "fedexAddendumNumber"
    t.string   "fedexContractorAddendumName"
    t.integer  "fedexContractorAddendumNumber"
    t.text     "content"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "fedexContract_id"
  end

  create_table "businesses", :force => true do |t|
    t.string   "name"
    t.string   "taxIDNumber"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "employees_id"
  end

  create_table "daily_data", :force => true do |t|
    t.integer  "deliveryStop"
    t.integer  "deliveryPackage"
    t.integer  "pickupStop"
    t.integer  "pickupPackage"
    t.integer  "calltag"
    t.integer  "didNotAttempt"
    t.decimal  "inboundLocalService"
    t.integer  "earlyPickUp"
    t.integer  "latePickUp"
    t.datetime "startTime"
    t.datetime "endTime"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "daily_data_delivery_exceptions", :force => true do |t|
    t.datetime "startDate"
    t.datetime "endDate"
    t.integer  "dailyData_id"
    t.integer  "deliveryException_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "daily_data_delivery_exceptions", ["dailyData_id"], :name => "index_daily_data_delivery_exceptions_on_dailyData_id"
  add_index "daily_data_delivery_exceptions", ["deliveryException_id"], :name => "index_daily_data_delivery_exceptions_on_deliveryException_id"

  create_table "daily_data_employees", :force => true do |t|
    t.integer  "employee_id"
    t.integer  "dailyData_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "daily_data_employees", ["dailyData_id"], :name => "index_daily_data_employees_on_dailyData_id"
  add_index "daily_data_employees", ["employee_id"], :name => "index_daily_data_employees_on_employee_id"

  create_table "daily_data_vehicles", :force => true do |t|
    t.integer  "vehicle_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "daily_data_id"
  end

  add_index "daily_data_vehicles", ["daily_data_id"], :name => "index_daily_data_vehicles_on_daily_data_id"
  add_index "daily_data_vehicles", ["vehicle_id"], :name => "index_daily_data_vehicles_on_vehicle_id"

  create_table "delivery_exceptions", :force => true do |t|
    t.string   "exceptionType"
    t.text     "exceptionDescription"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "employee_manager_assignments", :force => true do |t|
    t.datetime "startDate"
    t.datetime "endDate"
    t.boolean  "activeBoolean"
    t.integer  "employee_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "employee_manager_assignments", ["employee_id"], :name => "index_employee_manager_assignments_on_employee_id"

  create_table "employee_pays", :force => true do |t|
    t.integer  "employee_id"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "pay_id"
  end

  add_index "employee_pays", ["employee_id"], :name => "index_employee_pays_on_employee_id"

  create_table "employee_psas", :force => true do |t|
    t.datetime "startDate"
    t.datetime "endDate"
    t.boolean  "activeBoolean"
    t.integer  "employee_id"
    t.integer  "psa_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "employee_psas", ["employee_id"], :name => "index_employee_psas_on_employee_id"
  add_index "employee_psas", ["psa_id"], :name => "index_employee_psas_on_psa_id"

  create_table "employee_terminals", :force => true do |t|
    t.datetime "startDate"
    t.datetime "endDate"
    t.boolean  "activeBoolean"
    t.integer  "employee_id"
    t.integer  "terminal_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "employee_terminals", ["employee_id"], :name => "index_employee_terminals_on_employee_id"
  add_index "employee_terminals", ["terminal_id"], :name => "index_employee_terminals_on_terminal_id"

  create_table "employees", :force => true do |t|
    t.string   "firstName"
    t.string   "lastName"
    t.integer  "fedexNumber"
    t.integer  "contractorNumber"
    t.date     "hireDate"
    t.date     "dateOfBirth"
    t.boolean  "activeBoolean"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "terminationDate"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "business_id"
  end

  create_table "fedex_contracts", :force => true do |t|
    t.string   "fedexContractName"
    t.integer  "fedexContractNumber"
    t.string   "contractorContractName"
    t.integer  "contractorContractNumber"
    t.text     "content"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "businesses_id"
  end

  create_table "notes", :force => true do |t|
    t.integer  "notable_id"
    t.string   "notable_type"
    t.text     "content"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "pays", :force => true do |t|
    t.decimal  "amount"
    t.datetime "datetime"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "psa_states", :force => true do |t|
    t.integer  "psa_id"
    t.integer  "state_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "psa_states", ["psa_id"], :name => "index_psa_states_on_psa_id"
  add_index "psa_states", ["state_id"], :name => "index_psa_states_on_state_id"

  create_table "psas", :force => true do |t|
    t.string   "fedexPSAName"
    t.integer  "fedexPSANumber"
    t.string   "contractorPSAName"
    t.integer  "contractorPSANumber"
    t.boolean  "activeBoolean"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "regions_id"
    t.integer  "businesses_id"
  end

  create_table "psazips", :force => true do |t|
    t.integer  "psa_id"
    t.integer  "zip_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "psazips", ["psa_id"], :name => "index_psazips_on_psa_id"
  add_index "psazips", ["zip_id"], :name => "index_psazips_on_zip_id"

  create_table "regions", :force => true do |t|
    t.string   "fedexRegionName"
    t.integer  "fedexRegionNumber"
    t.string   "fedexRegionPhone"
    t.string   "contractorRegionName"
    t.integer  "contractorRegionNumber"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "service_types", :force => true do |t|
    t.string   "serviceType"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "state"
    t.string   "abbreviation"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "terminals", :force => true do |t|
    t.string   "fedexTerminalName"
    t.integer  "fedexTerminalNumber"
    t.string   "contractorTerminalName"
    t.integer  "contractorTerminalNumber"
    t.boolean  "colocationBoolean"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.integer  "regions_id"
  end

  create_table "user_roles", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "user_roles", ["role_id"], :name => "index_user_roles_on_role_id"
  add_index "user_roles", ["user_id"], :name => "index_user_roles_on_user_id"

  create_table "users", :force => true do |t|
    t.boolean  "contractorBoolean"
    t.boolean  "activeBoolean"
    t.integer  "employee_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "users", ["employee_id"], :name => "index_users_on_employee_id"

  create_table "vehicle_fuels", :force => true do |t|
    t.string   "fuelType"
    t.integer  "fuelTankSize"
    t.integer  "mpg"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "vehicle_odometers", :force => true do |t|
    t.integer  "odometerReading"
    t.datetime "startDate"
    t.datetime "endDate"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "vehicle_types", :force => true do |t|
    t.string   "vehicleSize"
    t.boolean  "bulkBoolean"
    t.string   "bodyMake"
    t.string   "bodyModel"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "vehicles", :force => true do |t|
    t.integer  "fedexVehicleNumber"
    t.string   "fedexVehicleName"
    t.integer  "contractorNumber"
    t.string   "contractorName"
    t.string   "vin"
    t.datetime "startDate"
    t.datetime "endDate"
    t.boolean  "activeBoolean"
    t.integer  "vehicleType_id"
    t.integer  "vehicleFuel_id"
    t.integer  "vehicleOdometer_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "service_type_id"
    t.integer  "business_id"
  end

  add_index "vehicles", ["service_type_id"], :name => "index_vehicles_on_service_type_id"
  add_index "vehicles", ["vehicleFuel_id"], :name => "index_vehicles_on_vehicleFuel_id"
  add_index "vehicles", ["vehicleOdometer_id"], :name => "index_vehicles_on_vehicleOdometer_id"
  add_index "vehicles", ["vehicleType_id"], :name => "index_vehicles_on_vehicleType_id"

  create_table "zips", :force => true do |t|
    t.string   "zip"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
