require 'base_packager'
require 'json'

class BuildpackPackager < BasePackager
  def dependencies
    []
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