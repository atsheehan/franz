# Franz

This is a simple chat application using Elixir/Phoenix and WebSockets. The purpose is to explore [Event Sourcing](http://martinfowler.com/eaaDev/EventSourcing.html); all events are first written to a Kafka log which are then propagated to a PostgreSQL database for reading.

This design was inspired by Martin Kleppman's talk ["Turning the database inside out with Apache Samza"](https://www.youtube.com/watch?v=fU9hR3kiOK0).


## Setup

To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
