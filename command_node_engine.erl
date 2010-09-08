-module(command_node_engine).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, _StartArgs) ->
	io:format("*** starting application *** ~p~n", [?MODULE]),
  command_node_supervisor:start_link([]).
	
stop(_State) ->
	ok.
	
