#table = :ets.new(:books, [:set])
#table |> :ets.insert({:dos, 20, 200})
#table |> :ets.insert({:tres, 30, 300})
#table |> :ets.insert({:cuatro, 40, 400})

#table |> :ets.lookup(:dos)
#[[:dos, 20, 200]]

#table |> :ets.delete(:dos)
#table |> :ets.delete() 

#table |> :ets.match({ :"$1", 10, :"$2" })
#[[:uno, 100]]

#table |> :ets.insert({:cuatro, 40, 410})
#table |> :ets.insert({:cuatro1, 40, 420})
#table |> :ets.insert({:cuatro2, 40, 430})

#table |> :ets.match({ :"$1", 40, :"$2" })
#[[:cuatro, 410], [:cuatro2, 430], [:cuatro1, 420]]

#table |> :ets.match({ :"$1", 40, :"_" })
#[[:cuatro], [:cuatro2], [:cuatro1]]

#exp = :ets.fun2ms( fn {title, rating, price} = book when rating < 50 -> book end )
#[{{:"$1", :"$2", :"$3"}, [{:<, :"$2", 50}], [:"$_"]}]

#table |> :ets.select(exp)
#[
#  {:dos, 20, 200},
#  {:cuatro, 40, 410},
#  {:uno, 10, 100},
#  {:tres, 30, 300},
#  {:cuatro2, 40, 430},
#  {:cuatro1, 40, 420}
#]