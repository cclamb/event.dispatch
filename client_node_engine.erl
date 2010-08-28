-module(client_node_engine).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, StartArgs) ->
	io:format("*** starting application *** ~p~n", [?MODULE]),
	Retval = client_node_supervisor:start_link(StartArgs),
	gen_event:add_handler(event_manager, remote_handler, []),
	gen_event:add_handler(event_manager, local_handler, []),
	Retval.
	
stop(_State) ->
	ok.
	