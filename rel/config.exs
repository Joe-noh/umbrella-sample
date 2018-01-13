# Import all plugins from `rel/plugins`
# They can then be used by adding `plugin MyPlugin` to
# either an environment, or release definition, where
# `MyPlugin` is the name of the plugin module.
Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_environment: Mix.env()

# For a full list of config options for both releases
# and environments, visit https://hexdocs.pm/distillery/configuration.html

environment :dev do
  # If you are running Phoenix, you should make sure that
  # server: true is set and the code reloader is disabled,
  # even in dev mode.
  # It is recommended that you build with MIX_ENV=prod and pass
  # the --env flag to Distillery explicitly if you want to use
  # dev mode.
  set dev_mode: true
  set include_erts: false
  set cookie: :"3QSi]La2O.!.;2s=UV>s6Yuyo9og@,6w{{C@1g]J.q7B$NiRTSz%FR{*cM~jM7yv"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"HumR0Lel!7DoNZ<@/5t%lqRZ/[_?QTpAtP!ZJLTd%sr!gu)%VAW`VF;wq3P@&z}["
end

release :main do
  set version: current_version(:main)
  set applications: [
    :runtime_tools,
    db_interface: :permanent,
    main: :permanent
  ]
end

release :db do
  set version: current_version(:db)
  set applications: [
    :runtime_tools,
    db: :permanent
  ]
end
