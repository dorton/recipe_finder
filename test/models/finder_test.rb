require "test_helper"
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "test/vcr_cassettes"
  config.hook_into :webmock
end

class FinderTest < ActiveSupport::TestCase

  test "imports the right amount of data" do
    VCR.use_cassette("results", :record => :new_episodes) do
      results = Finder.new.search("onion")
      assert_operator 20, :>=, results.count
    end
  end


  test "finder with blank search" do
    VCR.use_cassette("results", :record => :new_episodes) do
      results = Finder.new.search("")
      assert_equal 0, results.count
    end
  end

  test "finder with comma in search search" do
    VCR.use_cassette("results", :record => :new_episodes) do
      results = Finder.new.search("onion, potato")
      assert_operator 20, :>=, results.count
    end
  end

  test "known queries that throw an error" do
    VCR.use_cassette("results", :record => :new_episodes) do
      results = Finder.new.search("eggs bacon")
      assert_equal 0, results.count
    end
  end

end
