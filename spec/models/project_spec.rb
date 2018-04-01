require 'rails_helper'

RSpec.describe Project, type: :model do
  it "does not allow duplicate project name per user" do
    user = User.create(
      first_name: "Joe",
      last_name:  "Tester",
      email:      "joetester@example.com"
    )

    user.projects.create(
      name: "test project"
    )

    new_project = user.projects.build(
      name: "test project"
    )

    new_project.valid?
    expect(new_project.errors[:name]).to include("has already been taken")
  end

  it "allows two users to use same project name" do
    user = User.create(
      first_name: "Joe",
      last_name:  "Tester",
      email:      "joetester@example.com"
    )

    user.projects.create(
      name: "test project"
    )

    other_user = User.create(
      first_name: "Jack",
      last_name: "Tester",
      email: "jacktester@example.com"
    )

    new_project = other_user.projects.build(
      name: "test project"
    )

    expect(new_project).to be_valid
  end
end
