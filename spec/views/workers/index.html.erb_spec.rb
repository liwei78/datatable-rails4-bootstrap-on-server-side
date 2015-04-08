require 'rails_helper'

RSpec.describe "workers/index", type: :view do
  before(:each) do
    assign(:workers, [
      Worker.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :state => "State",
        :city => "City",
        :age => "Age",
        :salary => "Salary"
      ),
      Worker.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :state => "State",
        :city => "City",
        :age => "Age",
        :salary => "Salary"
      )
    ])
  end

  it "renders a list of workers" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
    assert_select "tr>td", :text => "Salary".to_s, :count => 2
  end
end
