defmodule Exq.Mixfile do
  use Mix.Project

  def project do
    [ app: :exq,
      version: "0.7.2",
      elixir: "~> 1.0.0 or ~> 1.1.1 or ~> 1.2",
      elixirc_paths: ["lib"],
      package: [
        maintainers: ["Alex Kira", "zhongwencool", "Denis Tataurov", "Justin McNally"],
        links: %{"GitHub" => "https://github.com/akira/exq"},
        licenses: ["Apache2.0"],
        files: ~w(lib test) ++
               ~w(LICENSE mix.exs README.md)
      ],
      description: """
      Exq is a job processing library compatible with Resque / Sidekiq for the Elixir language.
      """,
      deps: deps,
      test_coverage: [tool: ExCoveralls]
    ]
  end

  # Configuration for the OTP application
  def application do
    [
      mod: { Exq, [] },
      applications: [:logger, :tzdata, :redix, :timex, :uuid]
    ]
  end

  # Returns the list of dependencies in the format:
  # { :foobar, "0.1", git: "https://github.com/elixir-lang/foobar.git" }
  defp deps do
    [
      {:uuid, "~> 1.1.4" },
      {:redix, "~> 0.4.0"},
      {:poison, "~> 2.2.0"},
      {:timex, "~> 3.0.3" },
      {:excoveralls, "~> 0.5.5", only: :test},
      {:flaky_connection, github: "hamiltop/flaky_connection", only: :test},

      # docs
      {:ex_doc, ">= 0.13.0", only: :dev},
      {:inch_ex, ">= 0.0.0", only: :dev}
    ]
  end
end
