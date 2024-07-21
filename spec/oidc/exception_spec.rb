require 'spec_helper'

describe Oidc::HttpError do
  subject do
    Oidc::HttpError.new 400, 'Bad Request'
  end
  its(:status)   { should == 400 }
  its(:message)  { should == 'Bad Request' }
  its(:response) { should be_nil }
end

describe Oidc::BadRequest do
  its(:status)  { should == 400 }
  its(:message) { should == 'Oidc::BadRequest' }
end

describe Oidc::Unauthorized do
  its(:status)  { should == 401 }
  its(:message) { should == 'Oidc::Unauthorized' }
end

describe Oidc::Forbidden do
  its(:status)  { should == 403 }
  its(:message) { should == 'Oidc::Forbidden' }
end