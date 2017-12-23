defmodule DbInterface do
  def select_all do
    :rpc.call(:"db@localhost", Db, :select_all, [])
  end
end
