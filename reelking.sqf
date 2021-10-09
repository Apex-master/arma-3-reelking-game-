/*
    File: fn_reelKingSlot.sqf
    Author: Apex
    Description: Reel King Ladder game
*/

private["_betamt", "_display", "_level", "_winnings"];

_betamt = [_this, 0, 1, [0]] call BIS_fnc_param;

if (life_cash < _betamt) exitWith {
    hint format["You do not have enough money to play Reel King.", _betamt];
};

life_cash = life_cash - _betamt;

disableSerialization;

[] call life_fnc_hudUpdate;

_level = 0;
_winnings = 0;
gamblebtn = nil;
collectbtn = nil;
_display = findDisplay 1537;

_bet10K = _display displayCtrl 1541;
_bet50K = _display displayCtrl 1542;
_bet100K = _display displayCtrl 1543;
_bet500K = _display displayCtrl 1544;
_bet1M = _display displayCtrl 1545;
_reelKingBackground = _display displayCtrl 1538;
_gambleButton = _display displayCtrl 1539;
_collectButton = _display displayCtrl 1540;

_gambleTrigger = (_display displayCtrl 1539); // Gamble Button
_gambleTrigger ctrlAddEventHandler["ButtonClick", {
    gamblebtn = true;
}];

_collectTrigger = (_display displayCtrl 1540); // Collect Button
_collectTrigger ctrlAddEventHandler["ButtonClick", {
    collectbtn = true;
}];

RK_fnc_idle = {
    _bet10K ctrlEnable true;
    _bet50K ctrlEnable true;
    _bet100K ctrlEnable true;
    _bet500K ctrlEnable true;
    _bet1M ctrlEnable true;
    _gambleButton ctrlEnable false;
    _collectButton ctrlEnable false;
};

RK_fnc_inprogress = {
    _bet10K ctrlEnable false;
    _bet50K ctrlEnable false;
    _bet100K ctrlEnable false;
    _bet500K ctrlEnable false;
    _bet1M ctrlEnable false;
    _gambleButton ctrlEnable true;
    _collectButton ctrlEnable true;
};

call RK_fnc_inprogress;
life_action_inUse = true;

_number = ceil(random 2);

if (_number isEqualTo 1) exitWith {
    playSound "reelKingLose";
    life_action_inUse = false;
    call RK_fnc_idle;
    _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
};

if (_number isEqualTo 2) then {
    playSound "reelKingLevelWin";
    _reelKingBackground ctrlSetText "textures\reelking\stage1.paa";
    waitUntil {!(isNil "gamblebtn") || !(isNil "collectbtn")};
    gamblebtn = nil;
    sleep 0.5;
    if (collectbtn) exitWith {
        hint "You collected!";
        playSound "reelKingCollect";
        _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
        call RK_fnc_idle;
        _winnings = _betamt * 2;
        life_cash = life_cash + _winnings;
        [0] call SOCK_fnc_updatePartial;
    };

    _number2 = ceil(random 2);

    if (_number2 isEqualTo 1) exitWith {
        playSound "reelKingLose";
        life_action_inUse = false;
        call RK_fnc_idle;
        _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
    };

    if (_number2 isEqualTo 2) then {
        playSound "reelKingLevelWin";
        _reelKingBackground ctrlSetText "textures\reelking\stage2.paa";
    waitUntil {!(isNil "gamblebtn") || !(isNil "collectbtn")};

        gamblebtn = nil;
        sleep 0.5;
        if (collectbtn) exitWith {
            hint "You collected!";
            playSound "reelKingCollect";
            _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
            call RK_fnc_idle;
            _winnings = _betamt * 4;
            life_cash = life_cash + _winnings;
            [0] call SOCK_fnc_updatePartial;
        };
        collectbtn = nil;
        _number3 = ceil(random 2);

        if (_number3 isEqualTo 1) exitWith {
            playSound "reelKingLose";
            life_action_inUse = false;
            call RK_fnc_idle;
            _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
        };

        if (_number3 isEqualTo 2) then {
            playSound "reelKingLevelWin";
            _reelKingBackground ctrlSetText "textures\reelking\stage3.paa";
    waitUntil {!(isNil "gamblebtn") || !(isNil "collectbtn")};
            gamblebtn = nil;
            sleep 0.5;
            if (collectbtn) exitWith {
                hint "You collected!";
                playSound "reelKingCollect";
                _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                call RK_fnc_idle;
                _winnings = _betamt * 8;
                life_cash = life_cash + _winnings;
                [0] call SOCK_fnc_updatePartial;
            };
            _number4 = ceil(random 2);

            if (_number4 isEqualTo 1) exitWith {
                playSound "reelKingLose";
                life_action_inUse = false;
                call RK_fnc_idle;
                _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
            };

            if (_number4 isEqualTo 2) then {
                playSound "reelKingLevelWin";
                _reelKingBackground ctrlSetText "textures\reelking\stage4.paa";
    waitUntil {!(isNil "gamblebtn") || !(isNil "collectbtn")};

                gamblebtn = nil;
                sleep 0.5;
                if (collectbtn) exitWith {
                    hint "You collected!";
                    playSound "reelKingCollect";
                    _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                    call RK_fnc_idle;
                    _winnings = _betamt * 16;
                    life_cash = life_cash + _winnings;
                    [0] call SOCK_fnc_updatePartial;
                };
                _number5 = ceil(random 2);

                if (_number5 isEqualTo 1) exitWith {
                    playSound "reelKingLose";
                    life_action_inUse = false;
                    call RK_fnc_idle;
                    _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";

                };

                if (_number5 isEqualTo 2) then {
                    playSound "reelKingLevel6";
                    _reelKingBackground ctrlSetText "textures\reelking\stage5.paa";
    waitUntil {!(isNil "gamblebtn") || !(isNil "collectbtn")};

                    gamblebtn = nil;
                    sleep 0.5;
                    if (collectbtn) exitWith {
                        hint "You collected!";
                        playSound "reelKingCollect";
                        _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                        call RK_fnc_idle;
                        _winnings = _betamt * 32;
                        life_cash = life_cash + _winnings;
                        [0] call SOCK_fnc_updatePartial;
                    };
                    _number6 = ceil(random 2);

                    if (_number6 isEqualTo 1) exitWith {
                        playSound "reelKingLose";
                        life_action_inUse = false;
                        call RK_fnc_idle;
                        _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                    };

                    if (_number6 isEqualTo 2) then {
                        playSound "reelKingLevel7";
                        _reelKingBackground ctrlSetText "textures\reelking\stage6.paa";
    waitUntil {!(isNil "gamblebtn") || !(isNil "collectbtn")};

                        gamblebtn = nil;
                        sleep 0.5;
                        if (collectbtn) exitWith {
                            hint "You collected!";
                            playSound "reelKingCollect";
                            _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                            call RK_fnc_idle;
                            _winnings = _betamt * 64;
                            life_cash = life_cash + _winnings;
                            [0] call SOCK_fnc_updatePartial;
                        };
                        _number7 = ceil(random 2);

                        if (_number7 isEqualTo 1) exitWith {
                            playSound "reelKingLose";
                            life_action_inUse = false;
                            call RK_fnc_idle;
                            _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                        };

                        if (_number7 isEqualTo 2) then {
                            playSound "reelKingLevel8";
                            _reelKingBackground ctrlSetText "textures\reelking\stage7.paa";
     waitUntil {!(isNil "gamblebtn") || !(isNil "collectbtn")};

                            gamblebtn = nil;
                            sleep 0.5;
                            if (collectbtn) exitWith {
                                hint "You collected!";
                                playSound "reelKingCollect";
                                _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                                call RK_fnc_idle;
                                _winnings = _betamt * 128;
                                life_cash = life_cash + _winnings;
                                [0] call SOCK_fnc_updatePartial;
                            };
                            _number8 = ceil(random 2);

                            if (_number8 isEqualTo 1) exitWith {
                                playSound "reelKingLose";
                                life_action_inUse = false;
                                call RK_fnc_idle;
                                _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                            };

                            if (_number8 isEqualTo 2) then {
                                playSound "reelKingLevel9";
                                _reelKingBackground ctrlSetText "textures\reelking\stage8.paa";
     waitUntil {!(isNil "gamblebtn") || !(isNil "collectbtn")};

                                gamblebtn = nil;
                                sleep 0.5;
                                if (collectbtn) exitWith {
                                    hint "You collected!";
                                    playSound "reelKingCollect";
                                    _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                                    call RK_fnc_idle;
                                    _winnings = _betamt * 256;
                                    life_cash = life_cash + _winnings;
                                    [0] call SOCK_fnc_updatePartial;
                                };
                                _number9 = ceil(random 2);

                                if (_number9 isEqualTo 1) exitWith {
                                    playSound "reelKingLose";
                                    life_action_inUse = false;
                                    call RK_fnc_idle;
                                    _reelKingBackground ctrlSetText "textures\reelking\reelkingbg.paa";
                                };

                                if (_number9 isEqualTo 2) then {
                                    _gambleButton ctrlEnable false;
                                    _collectButton ctrlEnable false;
                                    playSound "reelKingJackpot";
                                    _reelKingBackground ctrlSetText "textures\reelking\stage9.paa";
                                    playSound "reelKingCollect";
                                    hint "you won the jackpot!";
                                    sleep 2;
                                    for "_i" from 1 to 5 do {
                                    _reelKingBackground ctrlSetText "textures\reelking\stage1.paa";
                                    sleep 0.2;
                                    _reelKingBackground ctrlSetText "textures\reelking\stage2.paa";
                                    sleep 0.2;
                                    _reelKingBackground ctrlSetText "textures\reelking\stage3.paa";
                                    sleep 0.2;
                                    _reelKingBackground ctrlSetText "textures\reelking\stage4.paa";
                                    sleep 0.2;
                                    _reelKingBackground ctrlSetText "textures\reelking\stage5.paa";
                                    sleep 0.2;
                                    _reelKingBackground ctrlSetText "textures\reelking\stage6.paa";
                                    sleep 0.2;
                                    _reelKingBackground ctrlSetText "textures\reelking\stage7.paa";
                                    sleep 0.2;
                                    _reelKingBackground ctrlSetText "textures\reelking\stage8.paa";
                                    sleep 0.2;
                                    _reelKingBackground ctrlSetText "textures\reelking\stage9.paa";
                                    sleep 0.2;
                                    };
                                    _winnings = _betamt * 500;
                                    life_cash = life_cash + _winnings;
                                    [0] call SOCK_fnc_updatePartial;
                                    sleep 30;
                                };
                            };
                        };
                    };
                };
            };
        };
    };
};
life_action_inUse = false;
[] call life_fnc_hudUpdate;
