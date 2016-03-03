require 'rails_helper'

RSpec.describe User, type: :model do
  it 'validates user' do
    should validate_presence_of(:email)
    should validate_presence_of(:password)
  end
end
