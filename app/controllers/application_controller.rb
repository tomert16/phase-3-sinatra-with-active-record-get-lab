class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

 get '/bakeries' do 
  bakery = Bakery.all
  bakery.to_json
 end

 get '/bakeries/:id' do 
  bakery = Bakery.find(params[:id])
  bakery.to_json(include: :baked_goods)
 end

 get '/baked_goods/by_price' do
  bg = BakedGood.all.order(price: :desc)
  bg.to_json
 end

 get '/baked_goods/most_expensive' do
  bg = BakedGood.order(price: :desc).first
  bg.to_json
 end

end
