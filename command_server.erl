-module(command_server).
-export([start/0, call/1]).

-define(COMMAND_MODULE, commander).

start() ->
  CommandHandler = command_handler:start(),
	register(?COMMAND_MODULE, spawn(fun() -> loop(CommandHandler) end)).
		
call(Packet) ->
	?COMMAND_MODULE ! Packet.
		
loop(CommandHandler) ->
	receive
		{event, Payload} ->
			io:format("command_server delegating event...~p~n", [Payload]),
			CommandHandler ! {event, Payload},
			loop(CommandHandler);
		Other ->
			io:format("command_server other match: ~p~n", [Other]),
			loop(CommandHandler)
	end.
