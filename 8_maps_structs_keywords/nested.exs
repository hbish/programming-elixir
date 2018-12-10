defmodule Customer do
  defstruct [name: "", company: ""]
end

defmodule BugReport do
  defstruct [owner: %Customer{}, details: "", severity: 1]
end

defmodule Main do
  def main do
    report = %BugReport{
      owner: %Customer{
        name: "Ben",
        company: "Tokimo"
      },
      details: "broken"
    }
    IO.inspect report
    IO.inspect report.owner.company

    report = %BugReport{
      report |
      owner: %Customer{
        report.owner |
        company: "hbish"
      },
      details: "broken"
    }
    IO.inspect report

    IO.inspect put_in(report.owner.company, "lol")
    IO.inspect update_in(report.owner.name, &("Mr. " <> &1))
    

  end
end

Main.main()