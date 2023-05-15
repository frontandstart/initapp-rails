class SomeWorker
  include Sidekiq::Worker

  def perform()
  end
end
