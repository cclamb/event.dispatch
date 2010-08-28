-module(communication_server).
-behaviour(gen_server).
-export([start/0, stop/0, register/1, call/1]).
-export([init/1, handle_call/3, handle_cast/2, handle_info/2, terminate/2, code_change/3]).

start() -> gen_server:start_link({local, ?MODULE}, ?MODULE, [], []).
stop() 	-> gen_server:call(?MODULE, stop).

register(CncHost)	-> gen_server:cast(?MODULE, {register, CncHost}).
call(Packet)		-> gen_server:cast(?MODULE, {call, Packet}).

init([]) ->
	io:format("*** init on CNC *** ~p~n", [?MODULE]),
	{ok, 0}.

handle_call(stop, _From, N) ->
	io:format("*** stopping *** ~p~n", [?MODULE]),
	{stop, normal, stopped, N + 1}.

handle_cast({register, CncHost}, N) ->
	io:format("*** registering with CNC *** ~p~n", [CncHost]),
	{noreply, N + 1};
handle_cast({call, Packet}, N) ->
	io:format("*** call from CNC *** ~p~n", [Packet]),
	{noreply, N + 1}.


handle_info(_Info, State) -> {noreply, State}.
terminate(_Reason, _State) -> ok.
code_change(_OldVsn, State, Extra) -> {ok, State, Extra}.