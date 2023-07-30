/*Game facts*/
game(stardew_valley).
game(earthbound).
game(botw).
game(pokemon_emerald).
game(fallout_new_vegas).
game(south_park_stick_of_truth).
game(skyrim).
game(persona5royal).

/*Game has mature rating*/
is_mature(fallout_new_vegas, mature).
is_mature(south_park_stick_of_truth, mature).
is_mature(skyrim, mature).
is_mature(persona5royal, mature).

/*Game does not have mature rating*/
not_mature(stardew_valley, not_mature).
not_mature(earthbound, not_mature).
not_mature(botw, not_mature).
not_mature(pokemon_emerald, not_mature).

/*Game has fantasy elements*/
is_fantasy(botw).
is_fantasy(pokemon_emerald).
is_fantasy(skyrim).
is_fantasy(persona5royal).

/*Game has no fantasy elements*/
not_fantasy(stardew_valley).
not_fantasy(earthbound).
not_fantasy(fallout_new_vegas).
not_fantasy(south_park_stick_of_truth).

/*Game has turn based combat*/
turn_based(earthbound).
turn_based(pokemon_emerald).
turn_based(south_park_stick_of_truth).
turn_based(persona5royal).

/*Game has no turn based combat*/
not_turn_based(stardew_valley).
not_turn_based(botw).
not_turn_based(fallout_new_vegas).
not_turn_based(skyrim).

/* Rule to recommend a game */
recommend_game(PreferredGame) :-
        can_play_mature(MaturePref),
        enjoys_fantasy(FantasyPref),
        enjoys_turn_based(TurnBasedPref),
        game(PreferredGame),
        satisfies_preferences(PreferredGame, MaturePref, FantasyPref, TurnBasedPref).

/* Rule to check if the user can play mature games */
can_play_mature(MaturePref) :-
        write('Can you play mature-rated games? (yes/no): '),
        read(MatureInput),
        (MatureInput = yes -> MaturePref = mature ; MaturePref = not_mature).

/* Rule to check if the user enjoys fantasy elements */
enjoys_fantasy(FantasyPref) :-
        write('Do you enjoy games with fantasy elements? (yes/no): '),
        read(FantasyInput),
        (FantasyInput = yes -> FantasyPref = is_fantasy ; FantasyPref = not_fantasy).

/* Rule to check if the user enjoys turn-based combat */
enjoys_turn_based(TurnBasedPref) :-
        write('Do you enjoy games with turn-based combat? (yes/no): '),
        read(TurnBasedInput),
        (TurnBasedInput = yes -> TurnBasedPref = turn_based ; TurnBasedPref = not_turn_based).

/* Rule to check if a game satisfies the user's preferences */
satisfies_preferences(Game, MaturePref, FantasyPref, TurnBasedPref) :-
        (MaturePref = mature -> is_mature(Game, mature) ; not_mature(Game, not_mature)),
        (FantasyPref = is_fantasy -> is_fantasy(Game) ; not_fantasy(Game)),
        (TurnBasedPref = turn_based -> turn_based(Game) ; not_turn_based(Game)),
        format('Your recommended game is: ~w!', [Game]).
