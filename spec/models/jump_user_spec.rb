require 'spec_helper'

describe JumpUser do
  it { should belong_to(:jump) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:jump) }
  it { should validate_presence_of(:user) } 
end