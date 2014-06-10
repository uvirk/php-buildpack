$: << 'cf_spec'

require 'spec_helper'

describe 'CF PHP Buildpack' do

  context 'with or without cached buildpack dependencies' do
    it 'deploys apps without dependencies' do
      Machete.deploy_app("simple") do |app|
        expect(app).to be_staged
        expect(app.homepage_html).to include('Simple app running')
      end
    end
  end

  context 'with cached buildpack dependencies' do

    context 'in an offline environment', if: Machete::BuildpackMode.offline? do

      context 'an app with vendored app dependencies' do
        it 'deploys' do
          Machete.deploy_app("app_with_local_dependencies") do |app|
            expect(app).to be_staged
            expect(app.homepage_html).to include('App with dependencies running')
            expect(app).to have_no_internet_traffic
          end
        end

        it 'deploys a HHVM app' do
          Machete.deploy_app("hhvm_web_app") do |app|
            expect(app).to be_staged

            logs = app.logs

            expect(logs).to include('Detected request for HHVM 3.0.1')
            expect(logs).to include('- HHVM 3.0.1')
            expect(app.homepage_html).to include('App with HHVM running')
          end
        end

        it 'deploys a symfony app' do
          Machete.deploy_app("symfony_hello_world_with_local_dependencies") do |app|
            expect(app).to be_staged

            expect(app.homepage_html).to include('Running on Symfony!')
          end
        end

        it 'deploys a wordpress app' do
          Machete.deploy_app("composer_wordpress", with_pg: true, database_name: "wordpress") do |app|
            expect(app).to be_staged
          end
        end
      end
    end
  end

  context 'without cached buildpack dependencies' do

    context 'in an online environment', if: Machete::BuildpackMode.online? do

      context 'an app with remote app dependencies' do
        it 'deploys a PHP app' do
          Machete.deploy_app("app_with_remote_dependencies") do |app|
            expect(app).to be_staged
            expect(app.homepage_html).to include('App with remote dependencies running')
          end
        end

        it 'deploys a HHVM app' do
          Machete.deploy_app("hhvm_web_app") do |app|
            expect(app).to be_staged

            logs = app.logs

            expect(logs).to include('Detected request for HHVM 3.0.1')
            expect(logs).to include('- HHVM 3.0.1')
            expect(app.homepage_html).to include('App with HHVM running')
          end
        end

        it 'deploys a symfony app' do
          Machete.deploy_app("symfony_hello_world") do |app|
            expect(app).to be_staged

            expect(app.homepage_html).to include('Running on Symfony!')
          end
        end

        it 'deploys a wordpress app' do
          Machete.deploy_app("composer_wordpress", with_pg: true, database_name: "wordpress") do |app|
            expect(app).to be_staged
          end
        end
      end
    end

    # context 'in an offline environment'
  end
end