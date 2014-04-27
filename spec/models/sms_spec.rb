require 'spec_helper'

describe Sms do
  it { should respond_to(:to) }
  it { should respond_to(:from) }
  it { should respond_to(:body) }
  it { should respond_to(:identifier) }
end
