# NOTE: only doing this in development as some production environments (Heroku)
# NOTE: are sensitive to local FS writes, and besides -- it's just not proper
# NOTE: to have a dev-mode tool do its thing in production.
if Rails.env.development?
  begin
    RailsERD.load_tasks
  rescue => e
    puts "Skipped auto-generating diagram: #{e.message}"
  end
end
