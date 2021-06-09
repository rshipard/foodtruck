get '/food' do
  results = all_food()
  erb :'/food/index', locals: { menu: results }
end

# Displays create form
get '/food/create' do
  erb :'food/new'
end

post '/food' do
  name = params[:name]
  price = params[:price]
  image_url = params[:image_url]
  description = params[:description]

  create_food(name, price, image_url, description)

  redirect '/food'
end

# Display individual Food
get '/food/:id' do |id|
  # Look up the particular food in the database by id
  params = [id]


  results = run_sql("SELECT * FROM food WHERE id = $1;", params)

  erb :'/food/show', locals: { item: results[0]} # Create an individual food display ERB 
end

# Display individual Food
get '/food/:id/edit' do |id|
  # Look up the food by id, and pass it to the template
  params = [id]
  results = run_sql("SELECT * FROM food WHERE id = $1;", params)


  erb :'food/edit', locals: { item: results[0]} # Need to create this template
end

# Update individual Food
put '/food/:id' do |id|
  # Get the parameters
  name = params[:name]
  price = params[:price]
  image_url = params[:image_url]
  description = params[:description]
  params = [name, price, image_url, description, id]

  # Run an UPDATE SQL query
  query = "UPDATE food SET name = $1, price = $2, image_url = $3, description = $4 WHERE id = $5;"
  run_sql( query )

  redirect "/food/#{id}"
end

# Delete individual food
delete '/food/:id' do |id|
  # Run a DELETE SQL QUERY
  params = [id]
  run_sql("DELETE FROM food WHERE id = $1;", params)
  redirect "/food"
end