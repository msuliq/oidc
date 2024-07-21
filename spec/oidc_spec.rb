require 'spec_helper'

describe Oidc do
  after { Oidc.debugging = false }

  its(:logger) { should be_a Logger }
  its(:debugging?) { should == false }

  describe '.debug!' do
    before { Oidc.debug! }
    its(:debugging?) { should == true }
  end

  describe '.debug' do
    it 'should enable debugging within given block' do
      Oidc.debug do
        SWD.debugging?.should == true
        WebFinger.debugging?.should == true
        Rack::OAuth2.debugging?.should == true
        Oidc.debugging?.should == true
      end
      SWD.debugging?.should == false
      Rack::OAuth2.debugging?.should == false
      Oidc.debugging?.should == false
    end

    it 'should not force disable debugging' do
      SWD.debug!
      WebFinger.debug!
      Rack::OAuth2.debug!
      Oidc.debug!
      Oidc.debug do
        SWD.debugging?.should == true
        WebFinger.debugging?.should == true
        Rack::OAuth2.debugging?.should == true
        Oidc.debugging?.should == true
      end
      SWD.debugging?.should == true
      WebFinger.debugging?.should == true
      Rack::OAuth2.debugging?.should == true
      Oidc.debugging?.should == true
    end
  end

  describe '.http_client' do
    context 'with http_config' do
      before do
        Oidc.http_config do |config|
          config.ssl.verify = false
        end
      end
      it 'should configure Oidc, SWD and Rack::OAuth2\'s http_client' do
        [Oidc, SWD, WebFinger, Rack::OAuth2].each do |klass|
          klass.http_client.ssl.verify.should be_falsy
        end
      end
    end
  end
end