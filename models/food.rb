def all_food()
  run_sql("SELECT * FROM food;")
end

def create_food(name, price, image_url, description)
  params = [name, price, image_url, description]
  sql_query = "INSERT INTO food(name,price,image_url, description) VALUES($1, $2, $3, $4);"
  run_sql(sql_query, params)
end

