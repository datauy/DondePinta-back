require 'rails_helper'

describe Style, type: :model do
  it 'validates a style' do
    should validate_presence_of(:name)
  end
end
