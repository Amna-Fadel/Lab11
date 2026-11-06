% ==========================================
% Name Game: Interactive List Manipulation in Prolog
% ==========================================

% Main predicate to start the game
start_game :-
    % Initial set of letters (a, b, c)
    Letters = [a, b, c],
    game_loop(Letters).

% Main interactive menu loop
game_loop(Letters) :-
    nl,
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    write('|: '),
    read(Choice),
    handle_choice(Choice, Letters).

% 1- Display the current set of letters
handle_choice(1, Letters) :-
    nl,
    format('Current set of letters: ~w~n', [Letters]),
    game_loop(Letters).

% 2- Add a letter (appends to the end by default)
handle_choice(2, Letters) :-
    write('Enter the letter to add (e.g., x): '),
    read(Letter),
    append(Letters, [Letter], NewLetters),
    format('Letter ~w added successfully.~n', [Letter]),
    game_loop(NewLetters).

% 3- Add a letter at the top (prepends to the list)
handle_choice(3, Letters) :-
    write('Enter the letter to add at the top (e.g., x): '),
    read(Letter),
    NewLetters = [Letter | Letters],
    format('Letter ~w added at the top successfully.~n', [Letter]),
    game_loop(NewLetters).

% 4- Add a letter at the bottom (appends to the list)
handle_choice(4, Letters) :-
    write('Enter the letter to add at the bottom (e.g., x): '),
    read(Letter),
    append(Letters, [Letter], NewLetters),
    format('Letter ~w added at the bottom successfully.~n', [Letter]),
    game_loop(NewLetters).

% 5- Delete a letter
handle_choice(5, Letters) :-
    write('Enter the letter to delete (e.g., a): '),
    read(Letter),
    (   select(Letter, Letters, NewLetters)
    ->  format('Letter ~w deleted successfully.~n', [Letter]),
        game_loop(NewLetters)
    ;   write('Letter not found in the current set!'), nl,
        game_loop(Letters)
    ).

% 6- Delete all letters
handle_choice(6, _Letters) :-
    write('All letters have been deleted.'), nl,
    game_loop([]).

% 7- Exit
handle_choice(7, _Letters) :-
    nl, write('Exiting Name Game. Goodbye!'), nl.

% Handle invalid choices
handle_choice(_, Letters) :-
    write('Invalid choice! Please try again.'), nl,
    game_loop(Letters).
