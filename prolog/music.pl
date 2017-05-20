plays('Johnny Cash', 'Guitar').
plays('Tim McIlrath', 'Guitar').
plays('Serj Tankian', 'Guitar').
plays('Serj Tankian', 'Piano').
plays('Hans Zimmer', 'Piano').

genre('Johnny Cash', 'Folk').
genre('Hans Zimmer', 'Classic').
genre('Serj Tanian', 'Rock').
genre('Tim McIlrath', 'Rock').

uses(X, Y) :- plays(Z, X), genre(Z, Y).
