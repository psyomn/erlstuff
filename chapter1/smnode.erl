-module(smnode).
-author("lethaljellybean at gmail.com"). 
-export([spawn_sm/0,smachine/3]).

-record(state_machina, {transition_table=[{}], accept_state=[], initial_state=q0}).

% @doc a quick sample of a state machine to 
%      use for all sorts of stuff.
%
%                     t0
%                     /\
%      q0 --- t1 ---> q1 -+ t1
%      /\                   |
%       `---- t0 ---- q2 ---+ 
%                     V t1
%
spawn_sm() ->
  spawn(fun() -> smnode:smachine([
    {q0, 1, q1},
    {q1, 0, q1},
    {q1, 1, q2}, 
    {q2, 0, q0},
    {q2, 1, q2}],
    [q0],
    q0) end).

% @doc This is a node that implements behaviour of a state machine
%      in a perhaps naive method. 
%
%      A state machine requires vertices, edges, and conditions to travel
%      on one edge to another. 
%      {From, {{state, token}, nextstate}}
smachine(States, AcceptStates, CurrentState) ->
  receive
    {From, Transition} -> 
      TRet = transist(States, Transition),
      case TRet =:= illegal of 
        true ->
          From ! "Can't let you do that transistion, Starfox",
          smachine(States, AcceptStates, CurrentState);
        false ->
	  From ! "Transition ok.",
	  From ! "Current state:",
	  From ! what_state(TRet, AcceptStates),
          smachine(States, AcceptStates, TRet)
      end;
    {From, terminate} -> 
      From ! terminated;
    _ -> 
      smachine(States, AcceptStates, CurrentState)
  end.

% @doc check to see whether the state machine is in finishing state
%      (whether the input has been accepted or rejected).
what_state(CurrentState, AcceptedStates) ->
  case lists:member(CurrentState, AcceptedStates) of 
    true ->
      accepted;
    false -> 
      rejected
  end.

% @doc trying to transist from one state to another by checking if 
%      the current node 
%
transist(   [],     _) -> illegal;
transist([H|T], Token) -> 
  {_,RequiredToken,NextState} = H,
  case Token =:= RequiredToken of
    true ->
      NextState;
    false -> 
      transist(T,Token)
  end.

