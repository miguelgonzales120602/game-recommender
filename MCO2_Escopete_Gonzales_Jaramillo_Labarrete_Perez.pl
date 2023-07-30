/* Game facts */
game(stardew_valley).
game(earthbound).
game(botw).
game(pokemon_emerald).
game(fallout_new_vegas).
game(south_park_stick_of_truth).
game(skyrim).
game(persona5royal).

/*Game has mature rating*/
is_mature(fallout_new_vegas).
is_mature(south_park_stick_of_truth).
is_mature(skyrim).
is_mature(persona5royal).

/*Game does not have mature rating*/
not_mature(stardew_valley).
not_mature(earthbound).
not_mature(botw).
not_mature(pokemon_emerald).

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

/* Game descriptions */
game_description(stardew_valley,
    "🔮 Stardew Valley - A peaceful farming life awaits you, where you'll sow seeds of friendship and harvest tales of heartwarming connections.").
game_description(earthbound,
    "🔮 Earthbound - Embark on a quirky and whimsical odyssey, where psychic powers and talking hamburgers are just the tip of the iceberg.").
game_description(botw,
    "🔮 Breath of the Wild - Venture into the sprawling kingdom of Hyrule, where destiny awaits among ancient ruins, mystical creatures, and the call of adventure.").
game_description(pokemon_emerald,
    "🔮 Pokémon Emerald - Enter the enchanting world of Pokémon, where you'll capture creatures, forge bonds, and strive to become the ultimate Pokémon Master.").
game_description(fallout_new_vegas,
    "🔮 Fallout: New Vegas - Step into the post-apocalyptic wasteland, where every choice shapes your destiny, and alliances can be as treacherous as the radioactive landscape.").
game_description(south_park_stick_of_truth,
    "🔮 South Park: Stick of Truth - In this hilarious and outrageous adventure, the quiet mountain town of South Park becomes your playground, full of irreverent humor.").
game_description(skyrim,
    "🔮 Skyrim - Unleash your inner dragonborn and explore the vast expanse of Tamriel, where ancient prophecies and mighty dragons await your destiny.").
game_description(persona5royal,
    "🔮 Persona 5 Royal - In the heart of Tokyo, you'll balance high school life with a hidden identity as a Phantom Thief, stealing hearts to save the world.").

/* Rule to recommend a game */
recommend_game(PreferredGame) :-
    writeln('══════════════════════════════════════════════════════'),
    writeln('꧁  Welcome, brave adventurer, and peer into the Mystical Crystal Ball! ꧂ '), nl,
    writeln('Now, before we set forth on our quest, answer a few questions, and the RPG world most suited to your tastes shall be revealed!'), 
    writeln('⋅•⋅⋅•⋅⊰⋅•⋅⋅•⋅⋅•⋅⋅•⋅∙∘☽༓☾∘∙•⋅⋅⋅•⋅⋅⊰⋅•⋅⋅•⋅⋅•⋅⋅•⋅'),nl,

    can_play_mature(MaturePref),
    enjoys_fantasy(FantasyPref),
    enjoys_turn_based(TurnBasedPref),
    game(PreferredGame),
    satisfies_preferences(PreferredGame, MaturePref, FantasyPref, TurnBasedPref).

/* Rule to check if the user can play mature games */
can_play_mature(MaturePref) :-
    write('╰┈ Can you withstand mature-rated games? (yes/no): '),nl,nl,
    writeln('Choose wisely, for your path may lead to realms of maturity or keep you in realms untainted.'),
    read(MatureInput),
    (MatureInput = yes -> MaturePref = mature ; MaturePref = not_mature).

/* Rule to check if the user enjoys fantasy elements */
enjoys_fantasy(FantasyPref) :-
    write('╰┈ Do you seek worlds where fantasy blooms? (yes/no): '), nl, nl,
    writeln('Unveil the desires of your heart and the enchanted realm that awaits shall emerge.'), 
    read(FantasyInput),
    (FantasyInput = yes -> FantasyPref = is_fantasy ; FantasyPref = not_fantasy).

/* Rule to check if the user enjoys turn-based combat */
enjoys_turn_based(TurnBasedPref) :-
    write('╰┈ Are you ready to embrace turn-based combat? (yes/no): '), nl, nl,
    writeln('Speak your truth, and the winds of fate shall reveal your destined style of battle.'),
    read(TurnBasedInput),
    (TurnBasedInput = yes -> TurnBasedPref = turn_based ; TurnBasedPref = not_turn_based).

/* Rule to check if a game satisfies the user's preferences */
satisfies_preferences(Game, MaturePref, FantasyPref, TurnBasedPref) :-
    (MaturePref = mature -> is_mature(Game) ; not_mature(Game)),
    (FantasyPref = is_fantasy -> is_fantasy(Game) ; not_fantasy(Game)),
    (TurnBasedPref = turn_based -> turn_based(Game) ; not_turn_based(Game)),nl,
    writeln('⋅•⋅⋅•⋅⊰⋅•⋅⋅•⋅⋅•⋅⋅•⋅∙∘☽༓☾∘∙•⋅⋅⋅•⋅⋅⊰⋅•⋅⋅•⋅⋅•⋅⋅•⋅'),
    format('Behold your recommended game:'), nl,
    game_description(Game, Description),
    writeln(Description),nl,
    writeln('Now, seize your destiny and embark on this extraordinary RPG adventure! May your tale be one of valor, discovery, and boundless wonder!'),
    writeln('══════════════════════════════════════════════════════').
