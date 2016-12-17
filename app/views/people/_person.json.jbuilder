json.extract! person, :id, :person_id, :name, :birthdate, :no_cases, :bloodtype, :id_no, :created_at, :updated_at
json.url person_url(person, format: :json)