require_relative "lib/guard/image_optim/version"

Gem::Specification.new do |s|
    s.name = "guard-image_optim"
    s.version = Guard::ImageOptimVersion::VERSION
    s.platform = Gem::Platform::RUBY
    s.authors = ["Ezekiel Gabrielse"]
    s.email = ["ezekg@yahoo.com"]
    s.homepage = "http://github.com/ezekg/guard-image_optim"
    s.summary = "Guard gem for image_optim"
    s.description = "Guard::ImageOptim automatically optimizes your images with image_optim."
    s.license = "MIT"

    s.required_rubygems_version = ">= 1.3.6"
    s.rubyforge_project = "guard-image_optim"

    s.add_dependency "guard", ">= 1.1.0"
    s.add_dependency "image_optim", "~> 0.18"
    s.add_dependency "image_optim_pack"

    s.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE.md]
    s.require_path = "lib"
end
