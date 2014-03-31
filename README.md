# Donations App

Small **Donations** applicaton with some polymorphic associations

# Software version dependencies

**Ruby**

```bash
ruby 2.1.1p76
```

**Rails**

```bash
Rails 4.0.4
```

**Postgres**

```bash
psql (PostgreSQL) 9.3.4
```

# Start application (Development)

Clone git repository

Install dependencies

```
bundle install
```

Migrate database

```
rake db:migrate
```

Run rails server

```
rails server -p 3001
```

# Running unicorn in production

```bash
bundle exec unicorn -E production -c config/unicorn.rb -p 3001 & disown
```


# Running the tests

In the application directory

```bash
rspec
```

# Deployment

**TODO**
- Set capistrano configuration for deployment
  - Review error due to new version changes (using `Capistrano (3.1.0)`)
- Set unicorn for configuration for deployment with capistrano
- Set nginx configuration deployable through capistrano
- Create unicorn, nginx erb templates

# TODO

- Set CSS to improve look and feel
