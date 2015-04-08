require 'rails_helper'

RSpec.describe "workers/new", type: :view do
  before(:each) do
    assign(:worker, Worker.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :state => "MyString",
      :city => "MyString",
      :age => "MyString",
      :salary => "MyString"
    ))
  end

  it "renders new worker form" do
    render

    assert_select "form[action=?][method=?]", workers_path, "post" do

      assert_select "input#worker_first_name[name=?]", "worker[first_name]"

      assert_select "input#worker_last_name[name=?]", "worker[last_name]"

      assert_select "input#worker_state[name=?]", "worker[state]"

      assert_select "input#worker_city[name=?]", "worker[city]"

      assert_select "input#worker_age[name=?]", "worker[age]"

      assert_select "input#worker_salary[name=?]", "worker[salary]"
    end
  end
end
