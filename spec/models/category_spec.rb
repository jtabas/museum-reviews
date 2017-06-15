require 'rails_helper'

RSpec.describe Museum, type: :maodel do
  it { should have_valid :category}
  it { should have_valid(:category).when('Art')}
end
