## Steps to install Neo4j in existing rails application

### Add Gem and bundle install
```
gem 'neo4j'
gem 'neo4j-core'
gem 'neo4j-rake_tasks'
```
### Require in Application.rb
```
require 'neo4j/railtie'
```
### Require in Rakefile to use rake commands to do these commands neo4j:install,config,start,shell,stop,restart
```
require 'neo4j/rake_tasks'
```
### To generate Neo4j models with `rails generate` command 
```
class Application < Rails::Application
  # ...

  config.generators { |g| g.orm :neo4j }
end
```
