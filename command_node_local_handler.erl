-module(command_node_local_handler).
-behaviour(gen_event).
-include("event_descriptor.hrl").
-export([init/1, handle_event/2, terminate/2, code_change/3, handle_call/2, handle_info/2]).

init(_Args) ->
    {ok, _Args}.

handle_event(ErrorMsg, State) ->
	  [CommandHost|_] = State,
    io:format("*** command node local *** ~p~n", [{ErrorMsg, CommandHost}]),
    {ok, State}.

terminate(_Args, _State) ->
    ok.

handle_call(_Msg, State) -> {noreply, State}.
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, Extra) -> {ok, State, Extra}.
