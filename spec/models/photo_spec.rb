require "spec_helper"

describe Photo do
  it "validates presence of location" do
    photo = Photo.create({})
    photo.errors.full_messages.should eql(["Location can't be blank"])
  end
end
