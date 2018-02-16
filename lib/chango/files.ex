defmodule Chango.Files do
  require Bunt

  def process_files(path_in, path_out) when is_bitstring(path_out) do
    File.ls!(path_in)
    |> Enum.map(&rename_files(&1, path_in, path_out))
  end

  def process_files(path_in, _path_out) do
    File.ls!(path_in)
    |> Enum.map(&rename_files(&1, path_in, path_in))
  end

  defp rename_files(file, _in, _out) when file == ".DS_Store", do: :ok

  defp rename_files(file, p_in, p_out) do
    file_path = make_path(p_in, file)
    if File.dir?(file_path) do
      deep_out = make_path(p_out, file)
      process_files(file_path, deep_out)
    else
      file_ext = String.split(file, ".") |> List.last
      file_path = make_path(p_in, file)
      {{y, m, d}, {hr, min, sec}} = File.stat!(file_path).ctime
      new_name = "#{p_out}/#{y}_#{m}_#{d}_#{hr}-#{min}-#{sec}.#{file_ext}"
      IO.puts "'#{file}' becomes: '#{new_name}'"
      File.rename(file_path, new_name)
    end
  end

  defp make_path(p1, p2), do: p1 <> "/" <> p2
end
