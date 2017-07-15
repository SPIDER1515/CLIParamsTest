defmodule CliTest do
  use Application

  def start(_type, _args) do
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main(args) do
    args
    |> parse_args
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args)

    case options do
      [name: name] -> greet(name)
      [help: true] -> show_help()
      _  -> 
        IO.puts "Invalid Option"
        show_help()
    end
  end

  defp greet(name) do
    IO.puts "Hi #{name}, how are you"
  end

  defp show_help do
    IO.puts """
      Usage:
          ./awesome_cli --name [your name]

        Options:
        --help  Show this help message.

        Description:
        Prints out an awesome message.
    """
  end

end
