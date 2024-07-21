# frozen_string_literal: true

require_relative "lib/oidc/version"

Gem::Specification.new do |spec|
  spec.name = "oidc"
  spec.version = Oidc::VERSION
  spec.authors = ["Suleyman Musayev"]
  spec.email = ["slmusayev@gmail.com"]

  spec.summary = "OpenID Connect (OIDC) Server & Client Library"
  spec.description = "OpenID Connect (OIDC) Server & Client Library"
  spec.homepage = "https://github.com/msuliq/oidc"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/msuliq/oidc"
  spec.metadata["changelog_uri"] = "https://github.com/msuliq/oidc/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "tzinfo"
  spec.add_dependency "attr_required"
  spec.add_dependency "activemodel"
  spec.add_dependency "validate_url"
  spec.add_dependency "email_validator"
  spec.add_dependency "mail"
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday-follow_redirects'
  spec.add_dependency "json-jwt"
  spec.add_dependency "swd"
  spec.add_dependency "webfinger"
  spec.add_dependency "rack-oauth2"
end
