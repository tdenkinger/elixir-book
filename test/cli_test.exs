defmodule CliTest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI, only: [parse_args: 1]

  test ":help returned by option parsing with -h or --help optons" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three args are returned if three are given" do
    assert parse_args(["user", "project", "99"]) == {"user", "project", 99}
  end

  test "count returns default when none is given" do
    assert parse_args(["user", "project"]) == {"user", "project", 4}
  end

  test "asking for help returns usage information" do
    assert process(:help) == "usage"
  end
end
