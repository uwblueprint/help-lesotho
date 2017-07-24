# README
The official repository for the Help Lesotho forums

## Setup

### NodeJS
This ain't no javascript app though!

Version `6.x`

### Yarn
[See the docs](https://yarnpkg.com/en/docs/install);

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
If you haven't already, install bundler (`gem install bundler`),
then install the dependencies:
```shell
bundle install
```

Install the front-end build dependencies
```shell
bin/yarn install
```

### Rake Things
```shell
rake db:create
rake db:migrate
```

## Run the app

Run the Rails server
```shell
rails s
```

In another session, run the `webpack-dev-server` to compile the frontend assets
```shell
bin/webpack-dev-server
```

### Frontend Setup

If a view isn't dynamic, it's rendered server side, otherwise a react component
is used.  This project uses the [webpacker](https://github.com/rails/webpacker)
gem to build all javascript and CSS.  The front end source files are located in
`app/frontend`.
