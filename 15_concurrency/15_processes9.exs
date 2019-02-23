defmodule WordCounter do
  def count(scheduler) do
    send scheduler, {:ready, self()}
    receive do
      {:count, file, word, client} ->
        send client, {:answer, file, word, count_word(file, word), self()}
        count(scheduler)
      {:shutdown} ->
        exit(:normal)
    end
  end

  defp count_word(file, word) do
    content = File.read!(file)
    content
    |> String.split
    |> Enum.count(&(&1 == word))
  end
end

defmodule Scheduler do
  def run(num_processes, module, func, dir, word) do
    {:ok, files} = File.ls(dir)
    files = Enum.map(files, fn file -> Path.join(dir, file) end)

    (1..num_processes)
    |> Enum.map(fn (_) -> spawn(module, func, [self()]) end)
    |> schedule_processes(files, word, Map.new)
  end

  defp schedule_processes(processes, queue, word, results) do
    receive do
      {:ready, pid} when queue != [] ->
        [next | tail] = queue
        send pid, {:count, next, word, self()}
        schedule_processes(processes, tail, word, results)

      {:ready, pid} ->
        send pid, {:shutdown}
        if length(processes) > 1 do
          schedule_processes(List.delete(processes, pid), queue, word, results)
        else
          results
        end

      {:answer, file, _word, result, _pid} ->
        schedule_processes(processes, queue, word, Map.put(results, file, result))
    end
  end
end

defmodule Runner do
  def run do

    Enum.each 1..10, fn num_processes ->
      {time, result} = :timer.tc(Scheduler, :run, [num_processes, WordCounter, :count, "data/", "cat"])
      if num_processes == 1 do
        IO.puts "\nInspecting the results:\n#{inspect result}\n\n"
        IO.puts "\n #   time (ms)"
      end
      :io.format "~2B     ~.2f~n", [num_processes, time / 1000.0]
    end
  end
end
