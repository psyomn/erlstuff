-module(smdigraph).
-author("lethaljellybean at gmail dot com").
-export([main/1,default_problem_set/0]).

% @doc main entry point. You can either specify a state machine
main(Args) ->
  io:format("args: ~p~n", [Args]),
  [StateMachine | Input] = Args,
  case Args == [] of 
    true  -> 
      ProblemSet = smdigraph:default_problem_set();
    false -> 
      ProblemSet = todo
  end,
  io:format("~p", [ProblemSet]).

% @doc The problem set we could use for this example.
%      We accept, with these settings, string input of
%      the following: (a+b(cb)*)*
default_problem_set() -> 
  [[{q0,a,q1}, {q1,b,q2}, {q1,a,q1},
    {q2,c,q3}, {q3,b,q2}],
    [q0,q2]].
