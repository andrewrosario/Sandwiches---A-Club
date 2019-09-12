require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:valid_attributes) do {
    name: "Ham",
    type_of: "filling",
    img_url: "/assets/banana.jpg",
    is_meat: "true",
    is_dairy_or_egg: "false",
    is_gluten_free: "false"
  }
  end

  let(:bad_type) do {
    name: "Ham",
    type_of: "meat",
    img_url: "/assets/banana.jpg",
    is_meat: "true",
    is_dairy_or_egg: "false",
    is_gluten_free: "false"
  }
  end

  let(:no_title) {valid_attributes.except(:name)}

  it "is valid when expected" do
    expect(Ingredient.new(valid_attributes)).to be_valid
  end

  it "is not valid without a name" do
    expect(Ingredient.new(no_title)).not_to be_valid 
  end

  it "is not valid with a bad type" do
    expect(Ingredient.new(bad_type)).not_to be_valid
  end
end
