require 'spec_helper'

describe User do
  it { should have_many(:jumps) }
  it { should have_many(:jump_users) }
  it { should have_many(:shared_jumps) }

  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:dob) }

  it { should have_secure_password }
end