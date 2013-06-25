-module(erlydtl_app).
-behaviour(application).

%% API.
-export([start/2]).
-export([stop/1]).

%% API.
start(_Type, _Args) ->
    %% compile our templates
    {ok, Dir} = application:get_env(erlydtl_test, template_dir),
    ok = erlydtl:compile_dir(Dir, templates),
    Dispatch = erlydtl_test:dispatchers(),
    {ok, Port} = application:get_env(port),
    {ok, _} = cowboy:start_http(
                http, 100, [{port, Port}],
                [{env, [{dispatch, Dispatch}]}]
               ).

stop(_State) ->
    ok.
