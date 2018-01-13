defmodule DbInterface do
  def select_all do
    :rpc.call(:"db@127.0.0.1", Db, :select_all, [])
  end
end
