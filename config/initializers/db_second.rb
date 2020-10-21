config =YAML::load(ERB.new(File.read(Rails.root.join("config","database_second.yml"))).result)

DB_SECOND = config[Rails.env]