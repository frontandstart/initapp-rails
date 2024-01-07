HealthBit.configure do |c|
  c.success_text = 'Works'
  c.headers = {
    'Content-Type' => 'text/plain;charset=utf-8',
    'Cache-Control' => 'private,max-age=0,must-revalidate,no-store'
  }

  c.success_code = 200
  c.fail_code = 500
  c.show_backtrace = false

  c.add('Redis success') do
    Redis.new(url: ENV['REDIS_URL']).ping == 'PONG'
  end

  c.add('Database success') do
    ActiveRecord::Base.connection.select_value('SELECT 1') == 1
  end
end