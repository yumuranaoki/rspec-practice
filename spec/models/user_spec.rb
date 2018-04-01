require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a first name, last name, and email" do
    user = User.new(
      first_name: "Aaron",
      last_name: 'Ramsey',
      email: 'test@example.com'
    )
    expect(user).to be_valid
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
    User.create(
      first_name: "Joe",
      last_name: "Tester",
      email: "test@example.com"
    )
    user = User.new(
      first_name: "Jack",
      last_name: "Tester",
      email: "test@example.com"
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a full name" do
    user = User.create(
      first_name: "Aaron",
      last_name: "Ramsey",
      email: "test@example.com"
    )
    expect(user.name).to eq "Aaron Ramsey"
  end
end
