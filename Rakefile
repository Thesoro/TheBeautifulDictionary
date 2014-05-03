# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

BeautifulDictionary::Application.load_tasks


Rails::TestTask.new("minitest:features" => "test:prepare") do |t|
  t.pattern = "test/features/**/*_test.rb"
end

Rails::TestTask.new("minitest:api" => "test:prepare") do |t|
  t.pattern = "test/api/**/*_test.rb"
end

Rake::Task["test:run"].enhance ["minitest:features", "minitest:api"]
