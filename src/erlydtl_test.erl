-module(erlydtl_test).

-export([start/0, dispatchers/0, reload_dispatchers/0]).

start() ->
    ok = application:start(erlydtl_test).

dispatchers() ->
    cowboy_router:compile([
                           {'_', [
                                  {"/", index, []}
                                 ]
                           }
                          ]).

reload_dispatchers() ->
    cowboy:set_env(http, dispatch,
                   dispatchers()).
