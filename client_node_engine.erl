-module(client_node_engine).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, StartArgs) ->
	[CommandHost | LinkArgs] = StartArgs,
	io:format("*** starting application *** ~p~n", [?MODULE]),
	Retval = client_node_supervisor:start_link(LinkArgs),
	gen_event:add_handler(event_manager, remote_handler, [CommandHost]),
	gen_event:add_handler(event_manager, local_handler, [CommandHost]),
	communication_server:register(CommandHost),
	Retval.
	
stop(_State) ->
	ok.
	
