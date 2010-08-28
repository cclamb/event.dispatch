-module(command_handler).
-export([start/0]).

start() ->
	spawn(fun loop/0).
		
loop() ->
	receive
		{event, Payload} ->
			io:format("command_handler handling event: ~p~n", [Payload]),
			loop();
		Other ->
			io:format("command_handler other match: ~p~n", [Other]),
			loop()
  end.
