require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  let(:product) {
    Product.create!(
      sku: "MyString",
      name: "MyString",
      description: "MyString",
      inventory: 1
    )
  }

  before(:each) do
    assign(:product, product)
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(product), "post" do

      assert_select "input[name=?]", "product[sku]"

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[description]"

      assert_select "input[name=?]", "product[inventory]"
    end
  end
end
