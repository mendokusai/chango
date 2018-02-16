defmodule Chango.Preview do
  require Bunt

  @moduledoc """
    This separates the heiarchial preview to it's own module. It _should_ mirror that of file.ex
    bunt docs: `https://github.com/rrrene/bunt`
  """
  @image_types ~w(jpeg jpg tiff png gif)
  @folder_path :color33
  @folder_file :chartreuse
  @img_path :color55
  @img_file :hotpink

  def preview_files(path, level \\ 0) do
    File.ls!(path)
    |> Enum.map(&preview(&1, path, level))
  end

  defp preview(file, _path, _level) when file == ".DS_Store", do: :ok

  defp preview(file, path, level) do
    file_path = make_path(path, file)
    if File.dir?(file_path) do
      [@folder_path, "#{String.duplicate("=", level)}>", @folder_file, "#{file} (dir)"]
      # |> IO.ANSI.format
      |> Bunt.puts
      preview_files(file_path, level + 1)
    else
      ext = String.split(file, ".") |> List.last
      print_imgs(file, level, ext)
    end
  end

  defp print_imgs(file, level, ext) do
    result = Enum.any?(@image_types, fn(ex) -> ex == ext end)
    if result do
      [@img_path, "#{String.duplicate("-", level)}>", @img_file , "#{file}"]
      |> Bunt.puts
    else
      :ok
    end
  end

  defp make_path(p1, p2), do: p1 <> "/" <> p2
end
