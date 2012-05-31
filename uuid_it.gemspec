spec = Gem::Specification.new do |s|
  s.name              = "uuid_it"
  s.version           = "0.1.4"
  s.authors           = ["André Duffeck"]
  s.email             = ["aduffeck@suse.de"]
  s.homepage          = "http://github.com/aduffeck/uuid_it"
  s.summary           = "A Rails plugin for easily assigning UUIDs to your models.."
  s.description       = <<-EOM
    You need to assign UUIDs to your model? UuidIt makes it as simple as adding one line of code to the according models.
  EOM

  s.has_rdoc         = false
  s.test_files       = Dir.glob "test/**/*_test.rb"
  s.files            = Dir["lib/**/*.rb", "lib/**/*.rake", "*.md", "LICENSE",
    "Rakefile", "rails/init.rb", "generators/**/*.*", "test/**/*.*"]
end
