# README
The official repository for the Help Lesotho forums

## Setup

### Ruby
Only the latest and greatest
[2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/)

Recommended: use [rbenv](https://github.com/rbenv/rbenv) to manage ruby
installations)

### Postgresql
Version 9.5.7

Ensure you have already created a database user with login credentials

```shell
sudo -u postgres createuser -s NAME
```

To set a password for your new user, first enter the postgres console
```shell
sudo -u postgres psql
```

Then, set the password
```shell
\password NAME
```

You can exit the postgres console via `\q`

### Environment variables
This project uses the [dotenv-rails](https://github.com/bkeepers/dotenv) gem to
load environment variables.  Copy the included `.env.sample` file to `.env` and
fill in the values for each variable

### Install App Dependencies
If you haven't already, install bundler (`gem install bundler`)
Then,
```shell
bundle install
```

### Rake Things
```shell
rake db:create
rake db:migrate
```

## Run the app
```shell
rails s
```
