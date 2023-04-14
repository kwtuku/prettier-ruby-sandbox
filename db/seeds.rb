Dir.glob(Rails.root.join("db/seeds/*.rb")) { |file| load(file) }
