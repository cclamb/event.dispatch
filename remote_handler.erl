-module(remote_handler).
-behaviour(gen_event).
-export([init/1, handle_event/2, terminate/2, code_change/3, handle_call/2, handle_info/2]).

init(_Args) ->
    {ok, _Args}.

handle_event(ErrorMsg, State) ->
    [CommandHost|_] = State,
    io:format("*** transmitting to control node *** ~p~n", [{ErrorMsg, CommandHost}]),
	  rpc:call(CommandHost, command_server, call, [{event, ErrorMsg}]),
    {ok, State}.

terminate(_Args, _State) ->
    ok.

handle_call(_Msg, State) -> {noreply, State}.
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, Extra) -> {ok, State, Extra}. 
