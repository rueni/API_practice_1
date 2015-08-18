require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(
  :adapter => 'postgresql',
  :database => 'good_eats'
)

# See list of restaurants
get '/api/restaurants' do
  Restaurant.all.to_json
end

# See restaurant on list
get '/api/restaurants/:id' do
  Restaurant.find(params[:id]).to_json
end

# Add restaurant to the list
post '/api/restaurants' do
  Restaurant.create(restaurant_params).to_json
end

# Update restaurant on the list
patch '/api/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update(restaurant_params)
  @restaurant.to_json
end
# Update restaurant on the list
put '/api/restaurants/:id' do
  @restaurant = Restaurant.find(params[:id])
  @restaurant.update(restaurant_params)
  @restaurant.to_json
end

# Delete a restaurant off the list
delete '/api/restaurants/:id' do
  Restaurant.destroy(params[:id]).to_json
end

private
def restaurant_params
  {
    :name => params[:name],
    :location => params[:location],
    :cuisine_type => params[:cuisine_type],
    :cost_person => params[:cost_person]
    }
end
