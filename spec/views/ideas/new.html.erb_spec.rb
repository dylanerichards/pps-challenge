require 'rails_helper'

RSpec.describe "ideas/new", :type => :view do
  before(:each) do
    assign(:idea, Idea.new(
      :title => "MyString",
      :body => "MyText",
      :category => nil
    ))
  end

  it "renders new idea form" do
    render

    assert_select "form[action=?][method=?]", ideas_path, "post" do

      assert_select "input#idea_title[name=?]", "idea[title]"

      assert_select "textarea#idea_body[name=?]", "idea[body]"

      assert_select "input#idea_category_id[name=?]", "idea[category_id]"
    end
  end
end
