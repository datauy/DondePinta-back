require 'rails_helper'

describe Beer, type: :model do
  before do
    @style = Style.create(name: 'Oatmeal Stout')
    @brewery = Brewery.create(
      name: 'Davok',
      brewery_type: 'Craft beer'
    )
  end

  it 'creates a beer' do
    b = Beer.new(
      style: @style,
      brewery: @brewery,
      brand: 'Davok Oatmeal Stout'
    )
    expect(b.valid?)
  end

  it 'validates beers' do
    should validate_presence_of(:style)
    should validate_presence_of(:brewery)
  end
end
