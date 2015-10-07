require 'rails_helper'

describe Item do
  it { should belong_to(:list) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:user_id) }
end
