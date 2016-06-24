# Franz

This is a simple chat application using Elixir/Phoenix and WebSockets. The purpose is to explore [Event Sourcing](http://martinfowler.com/eaaDev/EventSourcing.html); all events are first written to a Kafka log which are then propagated to a PostgreSQL database for reading.

This design was inspired by Martin Kleppman's talk ["Turning the database inside out with Apache Samza"](https://www.youtube.com/watch?v=fU9hR3kiOK0).


## Setup

Installing Kafka:

```
$ brew install kafka
$ brew services start zookeeper
$ brew services start kafka
```

Zookeeper is running on port 2181, Kafka on port 9092.

### Web Application

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

### Kafka Worker

There is a separate process that streams messages from Kafka and writes them to Postgres.

```
$ mix run lib/ingest/writer.exs
```

Not sure what the best way to run this is in the context of an Elixir/OTP application.
