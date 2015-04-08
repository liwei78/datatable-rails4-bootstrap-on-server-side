json.array!(@workers) do |worker|
  json.extract! worker, :id, :first_name, :last_name, :state, :city, :age, :salary
  json.url worker_url(worker, format: :json)
end
