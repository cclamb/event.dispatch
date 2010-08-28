-module(remote_handler).
-behaviour(gen_event).
-export([init/1, handle_event/2, terminate/2, code_change/3, handle_call/2, handle_info/2]).

init(_Args) ->
    {ok, []}.

handle_event(ErrorMsg, State) ->
    io:format("*** transmitting to control node *** ~p~n", [ErrorMsg]),
	rpc:call(foo@s907454, command_server, call, [{event, example_payload}]),
    {ok, State}.

terminate(_Args, _State) ->
    ok.

handle_call(_Msg, State) -> {noreply, State}.
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, Extra) -> {ok, State, Extra}. 