source 'https://rubygems.org'

# Gitolite Admin repository management
gem 'gitolite-rugged', git: 'https://github.com/jbox-web/gitolite-rugged.git', tag: '1.2.0'

## Redmine 3.x
## Ruby/Rack Git Smart-HTTP Server Handler (use our own repository because Redmine uses Rails 4.2 and Rack 1.6)
gem 'gitlab-grack', git: 'https://github.com/jbox-web/grack.git', require: 'grack', branch: 'fix_rails4'

## Redmine 2.x
## Ruby/Rack Git Smart-HTTP Server Handler (use our own repository because Redmine still uses Rails 3 and Rack 1.4)
# gem 'gitlab-grack', git: 'https://github.com/jbox-web/grack.git', require: 'grack', branch: 'fix_rails3'
# gem 'redcarpet', '~> 2.3.0'

# HAML views
gem 'haml-rails'

# Memcached client for GitCache
gem 'dalli'

# Redis client for GitCache
gem 'redis'
gem 'hiredis'

# Syntaxic coloration
gem 'github-markup'
gem 'RedCloth'
gem 'org-ruby'
gem 'creole'
# gem 'wikicloth'
gem 'asciidoctor'

# Rack parser for Hrack
gem 'rack-parser', require: 'rack/parser'

group :development, :test do
  gem 'rspec', '~> 3.0.0'
  gem 'rspec-rails', '~> 3.0.1'

  gem 'shoulda', '~> 3.5.0'
  gem 'shoulda-matchers', '~> 2.7.0'
  gem 'shoulda-context'

  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'sshkey'
  gem 'database_cleaner'

  # Code coverage
  gem 'simplecov', '~> 0.9.1'
  gem 'simplecov-rcov'

  # Junit results
  gem 'ci_reporter_rspec', '~> 1.0.0'

  # Publish to Coveralls
  gem 'coveralls', require: false

  # Publish to CodeClimate
  gem 'codeclimate-test-reporter', require: false
end

group :development do
  gem 'spring',                '~> 1.3.1'
  gem 'spring-commands-rspec', '~> 1.0.4'
  gem 'quiet_assets',          '~> 1.1.0'

  # gem 'brakeman', '~> 2.6.3'
  # gem 'bullet',   '~> 4.14.7'
end
