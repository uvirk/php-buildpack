require 'base_packager'
require 'json'

class BuildpackPackager < BasePackager
  def dependencies
    [
      'https://lang-php.s3.amazonaws.com/dist-beta/php-5.5.11.tar.gz',
      'https://lang-php.s3.amazonaws.com/dist-beta/php-5.5.12.tar.gz',
      'https://lang-php.s3.amazonaws.com/dist-beta/hhvm-3.0.1.tar.gz',
      'https://lang-php.s3.amazonaws.com/dist-beta/apache-2.4.9.tar.gz',
      'https://lang-php.s3.amazonaws.com/dist-beta/nginx-1.4.6.tar.gz',
      'https://lang-php.s3.amazonaws.com/dist-beta/composer.tar.gz'
    ]
  end

  def excluded_files
    [
      /\.git/,
      /repos/,
      /cf_spec/,
      /cf.Gemfile*/
    ]
  end
end

BuildpackPackager.new("php", ARGV.first.to_sym).package