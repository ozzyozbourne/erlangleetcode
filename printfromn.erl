-module(printfromn).
-export([print/1]).

print(0)  -> ok;
print(N)  -> io:format("~w~n", [N]),
                    print(N-1).
