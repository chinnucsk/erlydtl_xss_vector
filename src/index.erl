-module(index).

-export([init/3, handle/2, terminate/3]).

init(_Transport, Req, []) ->
    {ok, Req, undefined}.

%% @doc
%% handle/2 renders the base template which is simply the index for
%% the webpage.
handle(Req, State) ->
    TemplateVariables = [{safe, "Hello"},
                         {unsafe, <<"<script>alert('hello');</script>">>}],
    cowboy_req:reply(200, [], templates:base(TemplateVariables), Req),
    {ok, Req, State}.

terminate(_Reason, _Req, _State) ->
    ok.
