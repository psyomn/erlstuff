-module(digraphexample).
-author("lethaljellybean at gmail dot com").
-export([main/1]).

% @doc main entry point of the program. This is mainly to learn how
%      to use digraphs. It's kind of nice to see some graph theory
%      implemented in the language, though pretty simple.
%
%      This example has two vertices: v1, and v2. There are two edges
%      that connect v1 to v2, and v2 to v1. 
main(_) ->
  io:format("Building... ~n"),
  G  = digraph:new(),
  V1 = digraph:add_vertex(G, "Bob", node1),
  V2 = digraph:add_vertex(G, "Mary", node2),
  digraph:add_edge(G,V1,V2,"email"),
  digraph:add_edge(G,V2,V1,"txt message"),
  io:format("Done! ~n"),
  io:format("Problem configuration:~n"),
  io:format("  Vertices:  ~p~n", [digraph:vertices(G)]),
  io:format("  Edges:     ~p~n", [digraph:edges(G)]).

