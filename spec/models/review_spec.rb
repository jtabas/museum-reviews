require 'rails_helper'

RSpec.describe Review, type: :model do
  it { should belong_to :museum }

  it { should have_valid(:rating).when(3) }
  it { should_not have_valid(:rating).when(nil, "", "lolipop", 45, -300, 0) }
end
