require 'rails_helper'

RSpec.describe User, type: :model do
  # validations
  it { should validate_presence_of(:username) }
end
