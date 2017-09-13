require "test_helper"
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
end

class FinderTest < ActiveSupport::TestCase

  test "imports the right amount of data" do
    VCR.use_cassette("results") do
      results = Finder.new.search("onion")
      assert_equal 10, results.count
    end
  end


  test "finder with blank search" do
    VCR.use_cassette("results") do
      results = Finder.new.search("")
      assert_equal 0, results.count
    end
  end

end
