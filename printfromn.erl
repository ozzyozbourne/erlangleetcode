-module(printfromn).
-export([print/1, sum_digits/2, in_sequence/1, is_palindrome/4]).

print(0)  -> ok;
print(N)  -> io:format("~w~n", [N]),
                    print(N-1).

sum_digits(0,   Sum) -> Sum; 
sum_digits(Num, Sum) -> sum_digits(Num div 10, Sum + Num rem 10).
                 
in_sequence([_ | []]) -> true;
in_sequence([H | T]) -> if H > hd(T) -> false;
                           true -> in_sequence(T)
                                   end.
    
is_palindrome(_, _, _, false) -> false;
is_palindrome(_, L, R, _) when L >= R -> true;
is_palindrome(S, L, R, _) -> is_palindrome(S, L +1 , R - 1, lists:nth(L, S) == lists:nth(R, S)).
                                     
