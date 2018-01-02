Country.create(name: "India")
Country.create(name: "US")
State.create(name: "Rajasthan", country_id: Country.find_by(name: "India").id)
State.create(name: "Bihar", country_id: Country.find_by(name: "India").id)
State.create(name: "New York", country_id: Country.find_by(name: "US").id)
State.create(name: "California", country_id: Country.find_by(name: "US").id)
City.create(name: "Jaipur", country_id: Country.find_by(name: "India").id, state_id: State.find_by(name: "Rajasthan").id)
City.create(name: "Patna", country_id: Country.find_by(name: "India").id, state_id: State.find_by(name: "Bihar").id)
City.create(name: "Albany", country_id: Country.find_by(name: "US").id, state_id: State.find_by(name: "New York").id)
City.create(name: "Los Angeles", country_id: Country.find_by(name: "US").id, state_id: State.find_by(name: "California").id)