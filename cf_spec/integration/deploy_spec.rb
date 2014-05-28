$: << 'cf_spec'

require 'spec_helper'

describe 'CF PHP Buildpack' do

  context 'with cached buildpack dependencies' do

    context 'in an offline environment', if: Machete::BuildpackMode.offline? do

      context 'an app with vendored app dependencies' do
        xit 'deploys' do
          Machete.deploy_app("app_with_local_dependencies", :php) do |app|
            expect(app).to be_staged
            expect(app.homepage_html).to include('App with dependencies running')
          end
        end
      end

      context 'an app without app dependencies' do
        it 'deploys' do
          Machete.deploy_app("simple", :php) do |app|
            expect(app).to be_staged
            expect(app.homepage_html).to include('Simple app running')
          end
        end
      end
    end
  end

  context 'without cached buildpack dependencies' do

    context 'in an online environment', if: Machete::BuildpackMode.online? do

      context 'an app with remote app dependencies' do
        it 'deploys' do
          Machete.deploy_app("app_with_remote_dependencies", :php) do |app|
            expect(app).to be_staged
            expect(app.homepage_html).to include('App with remote dependencies running')
          end
        end
      end

      context 'an app without app dependencies' do
        it 'deploys' do
          Machete.deploy_app("simple", :php) do |app|
            expect(app).to be_staged
            expect(app.homepage_html).to include('Simple app running')
          end
        end
      end
    end
  end
end