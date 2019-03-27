## Steps to install Neo4j in existing rails application

### Add Gem and bundle install
```
gem 'neo4j'
gem 'neo4j-core'
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
### RAILS Configuration
For both new apps and existing apps there are multiple ways to configure how to connect to Neo4j. You can use environment variables, the `config/neo4j.yml` file, or configure via the Rails application config.

For the `config/neo4j.yml` file:
```
development:
  type: http
  url: http://localhost:7474

test:
  type: http
  url: http://localhost:7575

production:
  type: http
  url: http://neo4j:password@localhost:7000
```

For `config/application.rb` or `config/environments/(development|test|production).rb`
```
config.neo4j.session.type = :http
config.neo4j.session.url = 'http://localhost:7474'

# Or, for Bolt

config.neo4j.session.type = :bolt
config.neo4j.session.url = 'bolt://localhost:7687'
```
If using authentication(if you install using the built-in rake tasks) authentication is disabled.)
```
config.neo4j.session.url = 'http://neo4j:password@localhost:7474'
```

## For Production version
https://neo4j.com/docs/operations-manual/current/installation/

In `/etc/neo4j/neo4j.conf`,

```
dbms.connectors.default_listen_address=0.0.0.0
dbms.connectors.default_advertised_address=localhost
```

To start the Server,
```
sudo neo4j start
```
Migrate the database(Default is development environment), 
```
RAILS_ENV=Environment bundle exec rake neo4j:migrate
```


