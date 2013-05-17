describe "app rake task" do
  before do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require "lib/tasks/database"
    Rake::Task.define_task(:environment)
  end
  
  describe "rake db:insert_quakes" do
    before do
      Earthquake.destroy_all
    end
    it "should be idempotent" do
      @task_name = "db:insert_quakes"
      @rake[@task_name].invoke
      num = Earthquake.count
      @rake[@task_name].invoke
      Earthquake.count.should eq(num)
    end
  end
  
end