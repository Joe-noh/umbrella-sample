# Sample Umbrella Project

This consists of three applications

- `:basket_manager`
  - 1 basket == 1 process
- `:payment`
  - library module wich exports `Payment.checkout/1`
  - does nothing at this point
- `:web`
  - provides web interface
  - pheonix application

### Run

- `mix deps.get`
- `iex -S mix phoenix.server`
- open http://localhost:4000/basket/new
