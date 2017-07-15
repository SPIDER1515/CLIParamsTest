defmodule CliTest.Mixfile do
  use Mix.Project

  def project do
    [app: :cli_test,
     version: "0.1.0",
     elixir: "~> 1.4",
     escript: escript(),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def escript do
    [main_module: CliTest]
  end

  def application do
    [ applications: [],
      mod: {CliTest, []},
      extra_applications: [:logger]]
  end

  defp deps do
    []
  end
end
