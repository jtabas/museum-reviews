require 'rails_helper'

RSpec.describe Museum, type: :model do
  it { should have_many :reviews }

  it { should have_valid(:name).when("LOLOLloLLolol") }
  it { should_not have_valid(:name).when(nil, "") }

  it { should have_valid(:address).when("LOLOLloLLolol") }
  it { should_not have_valid(:address).when(nil, "") }
end
