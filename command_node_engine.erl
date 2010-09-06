-module(client_node_engine).
-behaviour(application).
-export([start/2, stop/1]).

start(_Type, StartArgs) ->
	[CommandHost, EventManager | LinkArgs] = StartArgs,
	io:format("*** starting application *** ~p~n", [?MODULE]),
  command_node_supervisor:start_link(LinkArgs).
	%Retval = client_node_supervisor:start_link(LinkArgs),
	%gen_event:add_handler(EventManager, remote_handler, [CommandHost]),
	%gen_event:add_handler(EventManager, local_handler, [CommandHost]),
	%communication_server:register(CommandHost),
	%Retval.
	
stop(_State) ->
	ok.
	
