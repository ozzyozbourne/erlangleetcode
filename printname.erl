-module(printname).
-export([print_name/2, 
         print_linearly_from_1_to_n/1, 
         print_linearly_from_n_to_1/1, 
         summation/1, 
         factorial/1, 
         fact/1]).

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
           
