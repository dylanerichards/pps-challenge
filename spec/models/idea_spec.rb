require "rails_helper"

describe Idea do
  it { should respond_to :title }
  it { should respond_to :body }

  it { should belong_to :category }

  it { should validate_presence_of :title }
  it { should validate_presence_of :body }
end
