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
- open [http://localhost:4000/basket/new](http://localhost:4000/basket/new)

### Release

- build releases
  - `MIX_ENV=prod mix release --env=prod --name=basket_manager`
  - `MIX_ENV=prod mix release --env=prod --name=payment`
  - `MIX_ENV=prod mix release --env=prod --name=web`
- run
  - `rel/basket_manager/bin/bsaket_manager start`
  - `rel/payment/bin/bsaket_manager start`
  - `PORT=4000 rel/web/bin/web start`
- open [http://localhost:4000/basket/new](http://localhost:4000/basket/new)
