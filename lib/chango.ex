defmodule Chango do
  @moduledoc """
  changes names of files to "YYYY_M_D_H-M-S.jpg"

  Args: --in=<folder/path>
        --out=<folder/path/of/location/to/save/to *TODO*>
        --test=true Generate preview of file structure.

  usage: `./chango --in=/User/username/Documents --test=true`
  """

  def main(args) do
    args |> parse_args |> process
   end

  def process({}) do
   IO.puts "No arguments given"
  end

  def process({path_in, path_out, nil}) do
   Chango.Files.process_files(path_in, path_out)
  end

  def process({path, _, true}) do
    Chango.Preview.preview_files(path)
  end

   defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args, switches: [in: :string, out: :string, test: :boolean])
    {options[:in], options[:out], options[:test]}
   end
end
