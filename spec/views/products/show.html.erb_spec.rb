require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
      sku: "Sku",
      name: "Name",
      description: "Description",
      inventory: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/2/)
  end
end
