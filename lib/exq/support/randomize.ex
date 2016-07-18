# https://groups.google.com/forum/#!topic/elixir-lang-talk/drTvms2hcwE
defmodule Exq.Support.Randomize do
  @on_load :reseed_generator

  def reseed_generator do
    :rand.seed(:os.timestamp())
    :ok
  end

  def random(number) do
    :rand.uniform(number)
  end
end
