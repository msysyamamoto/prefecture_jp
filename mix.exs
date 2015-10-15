defmodule PrefectureJp.Mixfile do
  use Mix.Project

  def project do
    [app: :prefecture_jp,
     version: "0.0.1",
     elixir: "~> 1.1",
     description: description,
     package: package,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:ecto, "~> 1.0", only: :test}]
  end

  defp description do
    """
    PrefectureJp is a library for Japanese prefecture.
    """
  end

  defp package do
      [maintainers: ["Masayasu Yamamoto"],
       licenses: ["MIT"],
       links: %{"GitHub" => "https://github.com/ymmtmsys/prefecture_jp"}]
    end
end
