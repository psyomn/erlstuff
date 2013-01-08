-module(smnode).
-author("lethaljellybean@gmail.com"). 
-export([smachine/2]).

% @doc This is a node that implements behaviour of a state machine
% in a perhaps naive method. 
%
% A state machine requires vertices, edges, and conditions to travel
% on one edge to another. 

smachine(PossibleStates, CurrentState) ->
  receive
    terminate -> ok
  end.

