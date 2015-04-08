require 'rails_helper'

RSpec.describe "workers/show", type: :view do
  before(:each) do
    @worker = assign(:worker, Worker.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :state => "State",
      :city => "City",
      :age => "Age",
      :salary => "Salary"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Age/)
    expect(rendered).to match(/Salary/)
  end
end
