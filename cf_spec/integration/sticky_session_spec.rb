$: << 'cf_spec'
require 'spec_helper'

describe 'sticky session management' do
  subject(:app) { Machete.deploy_app(app_name, {}) }
  let(:browser) { Machete::Browser.new(app) }


  context 'an app that uses PHP built in sessions' do
    let(:app_name) { 'simple' }

    specify 'creates a cookie named JSESSIONID' do
      browser.visit_path("/")

      expect(browser).to have_cookie_containing('JSESSIONID')
    end
  end
end
