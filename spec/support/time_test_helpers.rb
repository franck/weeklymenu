module TimeTestHelpers
  def stub_time(*args)
    time_now = Time.new(*args)
    Time.stub(:now) { time_now }
  end
end
