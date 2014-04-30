require 'spec_helper'

describe Jump do
  it { should have_many(:pictures) }
  it { should have_many(:videos) }
  it { should have_many(:shared_users) }
  it { should belong_to(:user) }

  it { should validate_presence_of(:jump_number) }
end