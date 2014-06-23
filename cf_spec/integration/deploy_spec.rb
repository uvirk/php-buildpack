$: << 'cf_spec'
require 'spec_helper'

describe 'CF PHP Buildpack' do
  subject(:app) { Machete.deploy_app(app_name, options) }
  let(:options) do
    {}
  end

  context 'with cached buildpack dependencies' do
    context 'in an offline environment', if: Machete::BuildpackMode.offline? do
      context 'app has dependencies' do
        let(:app_name) { 'app_with_local_dependencies' }

        specify do
          expect(app).to be_running
          expect(app.homepage_html).to include('App with dependencies running')
          expect(app).to have_no_internet_traffic
        end
      end

      context 'app has no dependencies' do
        let(:app_name) { 'simple' }

        specify do
          expect(app).to be_running
          expect(app.homepage_html).to include('Simple app running')
          expect(app).to have_no_internet_traffic
        end
      end

      context 'deploying a HHVM app' do
        let(:app_name) { 'hhvm_web_app' }

        specify do
          expect(app).to be_running

          logs = app.logs

          expect(logs).to include('Detected request for HHVM 3.0.1')
          expect(logs).to include('- HHVM 3.0.1')
          expect(app.homepage_html).to include('App with HHVM running')
          expect(app).to have_no_internet_traffic
        end
      end

      context 'deploying a symfony app' do
        let(:app_name) { 'symfony_hello_world_with_local_dependencies' }

        specify do
          expect(app).to be_running

          expect(app.homepage_html).to include('Running on Symfony!')
          expect(app).to have_no_internet_traffic
        end
      end

      context 'deploying a wordpress app' do
        let(:app_name) { 'composer_wordpress' }
        let(:options) do
          { with_pg: true, database_name: 'wordpress' }
        end

        specify do
          expect(app).to be_running
          expect(app).to have_no_internet_traffic
        end
      end
    end
  end

  context 'without cached buildpack dependencies' do
    context 'in an online environment', if: Machete::BuildpackMode.online? do
      context 'app has dependencies' do
        let(:app_name) { 'app_with_remote_dependencies' }

        specify do
          expect(app).to be_running
          expect(app.homepage_html).to include('App with remote dependencies running')
        end
      end

      context 'app has no dependencies' do
        let(:app_name) { 'simple' }

        specify do
          expect(app).to be_running
          expect(app.homepage_html).to include('Simple app running')
        end
      end

      context 'deploying a HHVM app' do
        let(:app_name) { 'hhvm_web_app' }

        specify do
          expect(app).to be_running

          logs = app.logs

          expect(logs).to include('Detected request for HHVM 3.0.1')
          expect(logs).to include('- HHVM 3.0.1')
          expect(app.homepage_html).to include('App with HHVM running')
        end
      end

      context 'deploying a symfony app' do
        let(:app_name) { 'symfony_hello_world' }

        specify do
          expect(app).to be_running
          expect(app.homepage_html).to include('Running on Symfony!')
        end
      end

      context 'deploying a wordpress app' do
        let(:app_name) { 'composer_wordpress' }
        let(:options) do
          { with_pg: true, database_name: 'wordpress' }
        end

        specify do
          expect(app).to be_running
        end
      end
    end
  end
end