Gem::Specification.new do |spec|
  spec.name          = "a11ynator"
  spec.version       = "0.1.0"
  spec.summary       = "A tool to check accessibility of web pages"
  spec.authors       = ["Juan Guiricich"]
  spec.email         = ["jguiricich@gmail.com"]
  spec.homepage      = "https://github.com/JuanGuiricich/a11ynator" # Optional but recommended
  spec.license       = "MIT" # Or whichever license you prefer

  spec.files         = Dir["lib/**/*.rb", "bin/*"] + ["README.md"]
  spec.executables << "a11ynator"

  spec.add_dependency "nokogiri", "~> 1.12"

  spec.add_development_dependency "rubocop", "~> 1.0"
  spec.add_development_dependency "rubocop-erb", "~> 1.0"
end
