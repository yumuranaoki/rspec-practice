require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @project = @user.projects.create(
      name: "Test Project"
    )
  end

  it "is valid with a first name, last name, and email" do
    expect(@user).to be_valid
  end

  it "is invalid without a first name" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid with a duplication email address" do
    user = FactoryBot.build(:user, email: "test@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a full name" do
    expect(@user.name).to eq "Aaron Ramsey"
  end

  it "returns user name that match searched name" do
    expect(User.search("Aaron")).to include(@user)
  end
end
