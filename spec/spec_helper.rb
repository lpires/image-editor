Dir[File.join(".", "app/**/*.rb")].each do |f|
  require f
end



RSpec.configure do |config|

end
