# Umbrella Smaple

This branch has three applications in `apps`

- `main`: uses `db_interface` to interact with `db`
- `db`: manages data
- `db_interface`: provides functions to call `db` RPC.

`main` and `db` are assumed to run in defferent node and communicate using RPC.

```
+--------------+
|     main     |         +--------------+
|              | - RPC - |      db      |
| db_interface |         +--------------+
+--------------+
```

### Play!

```console
# console 1
$ mix do deps.get, compile
$ mix release db
$ mix release main
$ ./_build/dev/rel/main/bin/db console --cookie=abc

# console 2
$ ./_build/dev/rel/main/bin/main console --cookie=abc

iex(main@127.0.0.1)1> DbInterface.select_all
[%{"dummy" => "data"}]
```

### reference

- [Designing scalable application with Elixir: from umbrella project to distributed system](https://medium.com/matic-insurance/designing-scalable-application-with-elixir-from-umbrella-project-to-distributed-system-42f28c7e62f1)
