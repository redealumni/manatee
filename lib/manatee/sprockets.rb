if Sprockets::VERSION.start_with?("3")
  require 'manatee/sprockets/jsh_processor_3x'
elsif Sprockets::VERSION.start_with?("2")
  require 'manatee/sprockets/jsh_processor_2x'
else
  raise 'Manatee requires Sprockets version 2.x or 3.x'
end
