cast = %{
  buttercup: %{
    actor: {"Robin", "Wright"},
    role: "princess"
  },
  westley: %{
    actor: {"Cary", "Elwes"},
    role: "farm boy"
  }
}

IO.inspect get_in(cast, [Access.key(:westley), :actor, Access.elem(1)])

IO.inspect get_and_update_in(
             cast,
             [Access.key(:buttercup), :role],
             fn (val) -> {val, "Queen"} end
           )

IO.inspect Access.pop(cast, :westley)