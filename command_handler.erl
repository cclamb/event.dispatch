-module(command_handler).
-export([start/0]).
-include("event_descriptor.hrl").

start() ->
	spawn(fun loop/0).
		
loop() ->
	receive
		{event, Payload} ->
			Packet = Payload#event_descriptor{},
			io:format("command_handler handling event: ~p~n", [Packet]),
			loop();
		Other ->
			io:format("command_handler other match: ~p~n", [Other]),
			loop()
  end.
