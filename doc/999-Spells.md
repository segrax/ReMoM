


ovr136
ovr137
ovr138

Spell Data
Spell Book
Spell Casting
Spell Cast Animation
Spell Researching



...
...
...
click on a spell in the spellbook from the main screen
"Instant"

...
...
...
complete the casting of a spell in the next turn procedure

...
...
...





e.g.,
spell_data_table[spell_idx].type == sdt_Summon
spell_idx != spl_Floating_Island
... |-> IDK_SummonAnim()



ovr060:044E 83 BF 18 9F 00                                  cmp     [_players.casting_cost_remaining+bx], 0
ovr060:045F 83 BF 1C 9F 00                                  cmp     [_players.casting_spell_idx+bx], 0

ovr135:09F3 8B BF 1C 9F                                     mov     _DI_spell_idx, [_players.casting_spell_idx+bx]

ovr135:2880 C7 87 18 9F 00 00                               mov     [_players.casting_cost_remaining+bx], 0
ovr135:2890 C7 87 1A 9F 00 00                               mov     [_players.casting_cost_original+bx], 0
ovr135:28A0 C7 87 1C 9F 00 00                               mov     [_players.casting_spell_idx+bx], 0


ovr134:08E0 89 BF 1C 9F                                     mov     [_players.casting_spell_idx+bx], _DI_spell_idx ; already asigned in Spellbook_Screen()


ovr134:08ED 8B 87 1E 9F                                     mov     ax, [_players.Skill_Left+bx]

ovr140:1C5B 29 87 18 9F                                     sub     [_players.casting_cost_remaining+bx], ax

ovr140:1C30 29 BF 18 9F                                     sub     [_players.casting_cost_remaining+bx], di


C7 87   mov
18 9F   casting_cost_remaining
83 BF   cmp
18 9F   casting_cost_remaining
29 87   sub ... ax
18 9F   casting_cost_remaining
29 BF   sub ... di
18 9F   casting_cost_remaining

8B 87   mov
1E 9F   Skill_Left



## Spell Researching

MoO2
Next_Turn_Calc()
    |-> Apply_All_Player_Changes_()
        |-> Check_For_Research_Breakthrough_()
Module: TECH
    Tech_Select_()

1oom
game_turn_process()
    |-> game_tech_research()
        |-> game_tech_get_new()
        |-> game_tech_finish_new()  ... ¿ same as populating the wizard's research spell list ?
        |-> ui_newtech()

Next_Turn_Proc()
    |-> Next_Turn_Calc()
        |-> Players_Update_Magic_Power()
        |-> Players_Apply_Magic_Power()
        |-> Players_Check_Spell_Research()

Players_Apply_Magic_Power() updates _players[].research_cost_remaining.

Next_Turn_Proc()
    |-> Next_Turn_Calc()
        |-> Players_Check_Spell_Research()
            |-> WIZ_LearnSpell__WIP()
            |-> Spell_Research_Select()
            |-> AI_Research_Picker__STUB()
