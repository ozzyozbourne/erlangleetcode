-module(printname).
-export([print_name/2, 
         print_linearly_from_1_to_n/1, 
         print_linearly_from_n_to_1/1, 
         summation/1, factorial/1, 
         fact/1, reverse/1, 
         palindrome/1, fibonacci/1, 
         subsequence/1, subseq/1, 
         is_subsequence/2, two_sum/2, 
         two_sum_two/2, missing_number/1, single_number/1]).

-spec single_number(Nums :: [integer()]) -> integer().
single_number(Nums) -> lists:foldl(fun(X, Acc) -> X bxor Acc end, 0, Nums).

-spec missing_number(Nums :: [integer()]) -> integer().
missing_number(Nums) -> A = lists:seq(0, length(Nums)), 
                        lists:sum(A) - lists:sum(Nums).

-spec two_sum_two(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum_two(Nums, Target) -> 
    Asc = lists:zip(lists:seq(1, length(Nums)), Nums),
    Dsc = lists:reverse(Asc),
    find(Asc, Dsc, Target).

find([{_, X}  | Asc],     [{_, Y}  | _] = Dsc, T) when X + Y < T -> find(Asc, Dsc, T);
find([{_, X}  | _] = Asc, [{_, Y}  | Dsc],     T) when X + Y > T -> find(Asc, Dsc, T);
find([{Xi, _} | _],       [{Yi, _} | _],      _)                 -> [Xi, Yi].


-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum(Nums, Target) ->
    N = lists:zip(lists:seq(0, length(Nums)-1), Nums), 
    R = [[Xi, Yi] || {Xi, X} <- N, {Yi, Y} <- N -- [{Xi, X}], X + Y =:= Target],
    hd(R).

-spec is_subsequence(S :: unicode:unicode_binary(), T :: unicode:unicode_binary()) -> boolean().
is_subsequence(S, T) -> lists:member(unicode:characters_to_list(S), subseq(unicode:characters_to_list(T))).

subseq([])      -> [[]];
subseq([H | T]) -> NoH = subseq(T),
                   WithH = [ [H|Sub] || Sub <- NoH],
                   WithH ++ NoH.

subsequence(N)          -> subsequence(N, []).
subsequence([], Acc)    -> io:format("~n~w~n", [lists:reverse(Acc)]);
subsequence([H|T], Acc) -> subsequence(T, [H | Acc]),
                           subsequence(T, Acc).

fibonacci(0) -> 0;
fibonacci(1) -> 1;
fibonacci(N) -> fibonacci(N-1) + fibonacci(N-2).

print_name(_, 0)    -> ok;
print_name(Name, N) -> io:format("~s~n", [Name]),
                       print_name(Name, N -1).

print_linearly_from_1_to_n(0) -> ok;
print_linearly_from_1_to_n(N) -> print_linearly_from_1_to_n(N-1),
                                 io:format("~w~n",[N]).

print_linearly_from_n_to_1(0) -> ok;
print_linearly_from_n_to_1(N) -> io:format("~w~n", [N]),
                                 print_linearly_from_n_to_1(N-1).

summation(N) -> summation_of_first_n(N, 0).
summation_of_first_n(0, Sum)  -> Sum;
summation_of_first_n(N, Sum)  -> summation_of_first_n(N-1, Sum + N).


factorial(N) -> factorial(N, 1).
factorial(0, Acc) -> Acc;
factorial(N, Acc) -> factorial(N-1, Acc * N).

fact(1) -> 1;
fact(N) -> N * fact(N-1).

reverse(List)         -> reverse(List, []).
reverse([], Acc)      -> Acc;
reverse([H | T], Acc) -> reverse(T, [H | Acc]).

palindrome(Value) -> R = lists:reverse(Value),
                     Value == R.
