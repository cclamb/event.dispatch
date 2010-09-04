-module(remote_handler).
-include("event_descriptor.hrl").
-behaviour(gen_event).
-export([init/1, handle_event/2, terminate/2, code_change/3, handle_call/2, handle_info/2]).

init(_Args) ->
    [CommandHost | _Other] = _Args,
    {ok, [CommandHost, 1, _Other]}.

handle_event(ErrorMsg, State) ->
    [CommandHost, SeqNum|_Other] = State,
    EventMsg = ErrorMsg#event_descriptor{id = SeqNum},
    io:format("*** transmitting to control node *** ~p~n", [{EventMsg, CommandHost, SeqNum}]),
	  rpc:call(CommandHost, command_server, call, [{event, EventMsg}]),
    {ok, [CommandHost, SeqNum + 1, _Other]}.

terminate(_Args, _State) ->
    ok.

handle_call(_Msg, State) -> {noreply, State}.
handle_info(_Info, State) -> {noreply, State}.
code_change(_OldVsn, State, Extra) -> {ok, State, Extra}. 
