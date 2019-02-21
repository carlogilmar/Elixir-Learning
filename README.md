### Learning Elixir Mar 2018

##### @carlogilmar

- Simple Exercises
	- Fibonacci
	- BeerSong
	- Guess my number
	- Fizz buzz
	- Square

- Advent of code
	- Inverse Captcha

- Advanced Elixir and OTP
	- Word Counter (Enums)
	- Word Counter with Streams
	- inspectable (protocols)
	- Point (data struct)
	- PingPong (process)
	- ETS Example Scripts
	- GenServer
	- Deck Example (GenServer)


```

#### Elixir Quote AST

quote do: (5*2)-1+7

{
  :+,
  [context: Elixir, import: Kernel],
    [
      {
        :-,
        [context: Elixir, import: Kernel],
        [
          {:*, [context: Elixir, import: Kernel], [5, 2]},
          1
        ]
      },
      7
    ]
 }

```
