require 'rails_helper'

describe 'Api::V1::BeersController', type: :request do
  before do
    brewery = Brewery.create(
      name: 'Davok',
      brewery_type: 'Type',
      department: 'Montevideo',
      city: 'Montevideo'
    )
    (1..10).each do |i|
      Beer.create(
        brand: 'Davok',
        style: i.to_s,
        color: 'black',
        alcohol: '5',
        draft: true,
        bitterness: '16',
        brewery: brewery
      )
    end
  end

  it 'Returns all posts' do
    get '/api/v1/beers', format: :json
    expect(response.status).to eq 200
    beers = JSON.parse(response.body)
    expect(beers.count).to eq 10
    expect(beers[0]['style']).to eq '1'
    expect(beers[0]['brand']).to eq 'Davok'
  end

  it 'returns a post' do
    id = Beer.first.id
    get "/api/v1/beers/#{id}", format: :json
    expect(response.status).to eq 200
    beer = JSON.parse(response.body)
    expect(beer['style']).to eq '1'
    expect(beer['brand']).to eq 'Davok'
  end
end
