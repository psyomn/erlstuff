-module(smnode).
-author("lethaljellybean@gmail.com"). 
-export([smachine/2]).

% TODO 
% @doc This is a node that implements behaviour of a state machine
% in a perhaps naive method. 
%
% A state machine requires vertices, edges, and conditions to travel
% on one edge to another. 
%
%                 t0
%                 /\
%  q0 --- t1 ---> q1 -+ t1
%  /\                   |
%   `---- t0 ---- q2 -- /
%                 V t1

sample_sm() ->
  smachine({ 
    {q0,t1,q1}, {q1,t0,q1},
    {q1,t1,q2}, {q2,t0,q0},
    {q2,t0,q0}
  }, q0).

% {From, {{state, token}, nextstate}}
smachine(PossibleStates, CurrentState) ->
  receive
    terminate -> ok
  end.

