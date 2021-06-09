# frozen_string_literal: true

desc 'Test docker images'
task :test do
  # check that the build system is available
  build_system = Docker.new()
  unless build_system.running?
    puts "#{build_system.name} sanity check failed.".red
    exit 1
  end

  puts '*** Testing images ***'.green
  $images.each do |image|
    puts "Running tests on #{image.build_tag}"
    sh "docker run --user 1000500 --rm #{image.build_tag} wp --info"
  end
end
