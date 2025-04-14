require 'nokogiri'
require 'a11ynator/analyzer'
require 'a11ynator/reporter'
require 'a11ynator/version'
require 'a11ynator/rules/base_rule'
require 'a11ynator/rules/missing_image_alt_rule'

module A11ynator
  def self.check_directory(directory)
    Analyzer.new(directory).run
  end
end
