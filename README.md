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
$ cd ./apps/db && iex --sname db@127.0.0.1 --cookie abc -S mix

# console 2
$ cd ./apps/main && iex --sname main@127.0.0.1 --cookie abc -S mix
iex(main@127.0.0.1)1> DbInterface.select_all
[%{"dummy" => "data"}]
```

### reference

- [Designing scalable application with Elixir: from umbrella project to distributed system](https://medium.com/matic-insurance/designing-scalable-application-with-elixir-from-umbrella-project-to-distributed-system-42f28c7e62f1)
