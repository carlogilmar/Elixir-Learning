defmodule Population do

  def get_population do
    [
      {"person", 2000, 2010},
      {"person", 1975, 2005},
      {"person", 1975, 2003},
      {"person", 1803, 1809},
      {"person", 1750, 1869},
      {"person", 1840, 1935},
      {"person", 1803, 1921},
      {"person", 1894, 1921}
    ]
  end

  def calculate_year() do
    get_population
      |> get_years_living_by_person()
      |> get_year_counters()
      |> sort_years()
  end

  def get_years_living_by_person(population) do
    years_by_person = for {_person, birth, dead} <- population, do: Enum.to_list(birth..dead)
    years = years_by_person |> List.flatten |> Enum.uniq
    counters_per_year = for year <- years, do: {year, 0}
    {years_by_person, Map.new(counters_per_year)}
  end

  def get_year_counters({years_by_person, counters_per_year}) do
    [person_years|years_by_person_tail] = years_by_person
    update_counters({person_years, years_by_person_tail, counters_per_year})
  end

  def update_counters({person_years, [], counters_per_year}) do
    [year|years_tail] = person_years
    attach_year({year, years_tail, counters_per_year})
  end
  def update_counters({person_years, years_by_person_tail, counters_per_year}) do
    [year|years_tail] = person_years
    counters_updated = attach_year({year, years_tail, counters_per_year})
    [next_person|years_by_person_tail] = years_by_person_tail
    update_counters({next_person, years_by_person_tail, counters_updated})
  end

  def attach_year({year, [], counters_per_year}) do
    new_counter = counters_per_year[year] + 1
    Map.put(counters_per_year, year, new_counter)
  end
  def attach_year({year, years_tail, counters_per_year}) do
    new_counter = counters_per_year[year] + 1
    counters_updated = Map.put(counters_per_year, year, new_counter)
    [next_year|years_tail] = years_tail
    attach_year({next_year, years_tail, counters_updated})
  end

  def sort_years(counters) do
    counters |> Map.to_list() |> List.keysort(1) |> Enum.reverse
  end
end
