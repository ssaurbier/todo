require 'rails_helper'

describe List do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user_id) }
end
