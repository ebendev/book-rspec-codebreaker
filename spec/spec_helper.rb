# by default, rspec only loads lib/ into the path, not the root project directory
$LOAD_PATH << File.expand_path('..', File.dirname(__FILE__))
