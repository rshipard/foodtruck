def run_sql(sql_query, params = []) #takes params 2nd argument
  # set default value to an empty array
  PG.connect(ENV['DATABASE_URL'] || {dbname: 'foodtruck'})
  # 1st arg name of statement, snd arg SQL query
  connection.prepare("unique_name_for_sql_statement", sql_query)
  results = connection.exec_prepared("unique_name_for_sql_statement", params)
  connection.close

  return results
end