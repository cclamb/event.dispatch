-module(command_node_supervisor).
-behaviour(supervisor).
-export([start_link/1, init/1, stop_supervised/0]).
		
start_link(Args) ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, Args).
	
stop_supervised() ->
  command_node_communication_server:stop(),
  event_reception_server:stop().
	
init([]) ->
	io:format("*** init(.) on supervisor *** ~p~n", [?MODULE]),
	{ok, {{one_for_one, 3, 10},
		[
		 {command_node_communication_server,
			{command_node_communication_server, start, []},
				 permanent, 
				 10000, 
				 worker, 
				 [command_node_communication_server]},
     {event_dispatch_server,
			{event_dispatch_server, start, []},
				 permanent, 
				 10000, 
				 worker, 
				 [event_dispatch_server]},
		 {event_reception_server,
			{event_reception_server, start, []},
				 permanent, 
				 10000, 
				 worker, 
				 [event_reception_server]}
		]}}.
