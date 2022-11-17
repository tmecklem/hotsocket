require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        sku: "Sku",
        name: "Name",
        description: "Description",
        inventory: 2
      ),
      Product.create!(
        sku: "Sku",
        name: "Name",
        description: "Description",
        inventory: 2
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new("Sku".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end
