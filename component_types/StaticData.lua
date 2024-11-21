-- The component that holds all the static data/functions used throughout the game.

StaticData = {

    -- Player death count and current type.
    deaths = 0,
    player_type = "Square",

    -- Level secrets found.
    secrets_found = {
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
        {Circle = false, Square = false},
    },

    -- Level progress.
    level_reached = {Circle = 1, Square = 1},
    player_progress = {
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
        {Circle = 1, Square = 1},
    },

    -- Music file & parameters.
    square_time = "event:/music/square_time",
    parameters = {Square = {Chords = {1,1,1,1,1,1,1,1,0,0,0,1,1},
                            ChordType = {0,0,1,1,1,1,0,0,1,1,1,1,0},
                            Bass = {0,1,1,1,1,1,1,1,0,0,0,0,0},
                            Melody = {0,0,1,1,1,0,0,0,0,1,1,1,0},
                            Groove = {0,0,0,1,1,1,1,0,0,0,1,1,1},
                            Sustain = {0,0,0,0,0,0,0,1,1,1,1,1,0},
                            Harp = {0,0,0,0,1,1,0,0,1,1,1,1,0}},
                  Circle = {Chords = {0,0,1,1,0,0,0,0,0,0,0,1,1},
                            ChordType = {1,1,1,1,1,1,1,1,1,1,1,1,1},
                            Bass = {1,1,1,1,1,1,1,1,0,0,1,1,0},
                            Melody = {1,1,1,1,1,1,1,0,0,1,1,1,1},
                            Groove = {0,0,0,0,0,0,1,1,1,1,1,1,1},
                            Sustain = {0,1,1,1,1,0,1,1,0,0,1,1,0},
                            Harp = {0,0,0,1,1,1,0,0,1,1,1,1,0}}
    },
    final_music = {
        Square = {Chords = {1,1,1,1,1,0,0},
                  ChordType = {1,1,1,1,1,1,1},
                  Bass = {0,1,0,0,0,0,0},
                  Melody = {1,1,1,1,1,1,1},
                  Groove = {0,0,0,0,0,0,0},
                  Sustain = {1,0,0,0,1,1,0},
                  Harp = {1,1,1,0,0,0,0}},
        Circle = {Chords = {1,1,1,1,0,0,0},
                  ChordType = {1,1,1,1,1,1,0},
                  Bass = {1,1,1,0,0,0,0},
                  Melody = {0,0,0,0,1,0,0},
                  Groove = {1,0,0,0,0,0,0},
                  Sustain = {1,1,0,0,0,0,0},
                  Harp = {1,1,1,1,1,1,0}}
    },

    -- Stage block and background layouts.
    stage_layout = {
        {Steel = {Vector2(28,-4),Vector2(28,-5),Vector2(28,-6),Vector2(28,-7),Vector2(-3,0),Vector2(-3,1),Vector2(-3,2),Vector2(-2,2),Vector2(-3,-1),Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(4,2),Vector2(5,2),Vector2(6,2),Vector2(7,2),Vector2(8,2),Vector2(9,2),Vector2(10,2),Vector2(11,2),Vector2(12,2),Vector2(13,2),Vector2(14,2),Vector2(15,2),Vector2(16,2),Vector2(17,2),Vector2(18,2),Vector2(19,2),Vector2(20,2),Vector2(21,2),Vector2(22,2),Vector2(23,2),Vector2(23,1),Vector2(23,0),Vector2(23,-1),Vector2(23,-2),Vector2(23,-3),Vector2(24,-3),Vector2(25,-3),Vector2(26,-3),Vector2(27,-3),Vector2(3,1),Vector2(28,-3),Vector2(9,0),Vector2(9,1),Vector2(10,0),Vector2(11,0),Vector2(12,0),Vector2(10,1),Vector2(11,1),Vector2(12,1),Vector2(13,1),Vector2(13,0),Vector2(14,1),Vector2(17,-1),Vector2(20,-2),Vector2(-11.5,-4),Vector2(-11.5,-3),Vector2(-11.5,-2),Vector2(-11.5,-1),Vector2(-11.5,0),Vector2(-11.5,1),Vector2(-11.5,2),Vector2(-11.5,3),Vector2(-11.5,4),Vector2(-11.5,5),Vector2(-11.5,6),Vector2(-11.5,7),Vector2(-10.5,7),Vector2(-9.5,7),Vector2(-8.5,7),Vector2(-7.5,7),Vector2(-6.5,7),Vector2(-5.5,7),Vector2(-4.5,7),Vector2(6,7),Vector2(-4.5,8),Vector2(6,8),Vector2(-4.5,9),Vector2(6,9),Vector2(-4.5,10),Vector2(6,10),Vector2(-4.5,11),Vector2(6,11),Vector2(-4.5,12),Vector2(6,12),Vector2(-4.5,13),Vector2(6,13),Vector2(-4.5,14),Vector2(6,14),Vector2(-4,18),Vector2(6,15),Vector2(6,16),Vector2(6,17),Vector2(-3,18),Vector2(-2,18),Vector2(6,18),Vector2(5,18),Vector2(4,18),Vector2(3,18),Vector2(2,18),Vector2(1,18),Vector2(0,18),Vector2(-1,18),Vector2(-5,18),Vector2(-6,18),Vector2(-7,18),Vector2(-8,18),Vector2(-8,16),Vector2(-9,18),Vector2(-10,18),Vector2(-11,18),Vector2(-12,18),Vector2(-13,18),Vector2(-13,14),Vector2(-14,18),Vector2(-15,18),Vector2(-16,18),Vector2(-17,18),Vector2(-18,18),Vector2(-18,12),Vector2(-19,18),Vector2(-20,18),Vector2(-21,18),Vector2(-22,18),Vector2(-23,18),Vector2(-23,17),Vector2(-23,16),Vector2(-23,15),Vector2(-23,14),Vector2(-23,13),Vector2(-23,12),Vector2(-23,11),Vector2(-23,10),Vector2(-24,10),Vector2(-25,10),Vector2(-26,10),Vector2(-27,10),Vector2(-28,10),Vector2(-26,9),Vector2(-26,8),Vector2(-26,7),Vector2(-29,10),Vector2(-30,10),Vector2(-31,10),Vector2(-32,10),Vector2(-32,9),Vector2(-32,8),Vector2(-32,7),Vector2(-32,6),Vector2(-32,5),Vector2(-32,4),Vector2(-32,3)},
		Checkpoint = {Vector2(0,0)},
		Pie = {Vector2(25,-5)},
		Secret = {Vector2(-30,8)}},
        {Steel = {Vector2(-2,2),Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(4,2),Vector2(5,2),Vector2(6,2),Vector2(7,2),Vector2(8,2),Vector2(9,2),Vector2(10,2),Vector2(15,2),Vector2(16,2),Vector2(17,2),Vector2(18,2),Vector2(19,2),Vector2(20,2),Vector2(21,2),Vector2(21,0),Vector2(21,-1),Vector2(21,-2),Vector2(25,1),Vector2(25,-1),Vector2(25,-2),Vector2(25,-3),Vector2(26,1),Vector2(27,1),Vector2(28,1),Vector2(29,1),Vector2(30,1),Vector2(30,-3),Vector2(31,-3),Vector2(32,-3),Vector2(33,-3),Vector2(34,-3),Vector2(34,1),Vector2(35,1),Vector2(36,1),Vector2(37,1),Vector2(48,10),Vector2(49,10),Vector2(50,10),Vector2(51,10),Vector2(52,10),Vector2(53,10),Vector2(54,10),Vector2(55,10),Vector2(56,10),Vector2(57,10),Vector2(58,10),Vector2(59,10),Vector2(59,8),Vector2(59,6),Vector2(59,4),Vector2(59,3),Vector2(59,2),Vector2(59,1),Vector2(60,10),Vector2(61,10),Vector2(62,10),Vector2(63,10),Vector2(63,9),Vector2(63,7),Vector2(63,5),Vector2(64,5),Vector2(65,5),Vector2(66,5)},
        Kill = {Vector2(-2,1),Vector2(-2,0),Vector2(-2,-1),Vector2(-2,-2),Vector2(4,1),Vector2(10,-1),Vector2(11,-1),Vector2(12,-1),Vector2(13,-1),Vector2(14,-1),Vector2(15,-1),Vector2(21,3),Vector2(22,3),Vector2(23,3),Vector2(24,3),Vector2(25,3),Vector2(25,2),Vector2(30,-2),Vector2(31,1),Vector2(32,1),Vector2(32,0),Vector2(33,1),Vector2(34,-2),Vector2(-9,10),Vector2(-8,10),Vector2(-7,10),Vector2(-6,10),Vector2(-5,10),Vector2(-4,10),Vector2(-3,10),Vector2(-2,10),Vector2(-1,10),Vector2(0,10),Vector2(1,10),Vector2(2,10),Vector2(3,10),Vector2(4,10),Vector2(5,10),Vector2(6,10),Vector2(7,10),Vector2(8,10),Vector2(9,10),Vector2(10,10),Vector2(11,10),Vector2(12,10),Vector2(13,10),Vector2(14,10),Vector2(15,10),Vector2(16,10),Vector2(17,10),Vector2(18,10),Vector2(19,10),Vector2(20,10),Vector2(21,10),Vector2(22,10),Vector2(23,10),Vector2(24,10),Vector2(25,10),Vector2(26,10),Vector2(27,10),Vector2(28,10),Vector2(29,10),Vector2(30,10),Vector2(31,10),Vector2(32,10),Vector2(33,10),Vector2(34,10),Vector2(35,10),Vector2(36,10),Vector2(37,10),Vector2(38,10),Vector2(39,10),Vector2(40,10),Vector2(41,10),Vector2(42,10),Vector2(43,10),Vector2(44,10),Vector2(45,10),Vector2(46,10),Vector2(47,10),Vector2(53,9),Vector2(53,6),Vector2(55,6),Vector2(54,6),Vector2(55,7),Vector2(67,5),Vector2(70,5),Vector2(71,5),Vector2(72,5),Vector2(73,5),Vector2(74,5),Vector2(67,6),Vector2(70,6),Vector2(67,7),Vector2(70,7),Vector2(67,8),Vector2(70,8),Vector2(67,9),Vector2(70,9),Vector2(67,10),Vector2(70,10),Vector2(67,11),Vector2(70,11),Vector2(67,12),Vector2(70,12),Vector2(67,13),Vector2(70,13),Vector2(67,14),Vector2(70,14),Vector2(67,15),Vector2(70,15),Vector2(67,16),Vector2(68,16),Vector2(69,16),Vector2(70,16),Vector2(64,10),Vector2(64,9),Vector2(64,8),Vector2(64,7),Vector2(64,6),Vector2(58,8),Vector2(58,7),Vector2(58,6),Vector2(58,5),Vector2(58,4)},
        Checkpoint = {Vector2(0,0),Vector2(18,0),Vector2(27,-1),Vector2(49,8),Vector2(61,8),Vector2(64,3)},
        Pie = {Vector2(36,-1)},
        Secret = {Vector2(68.5,14)}},
        {Steel = {Vector2(-7,-1),Vector2(-6,-1),Vector2(-5,-1),Vector2(-4,-1),Vector2(-3,-1),Vector2(-3,0),Vector2(-3,1),Vector2(-3,2),Vector2(-2,2),Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(4,2),Vector2(5,2),Vector2(6,2),Vector2(-13,-13),Vector2(-14,-13),Vector2(-15,-13),Vector2(-16,-13),Vector2(-16,-20),Vector2(-16,-21),Vector2(-16,-22),Vector2(-16,-23),Vector2(-16,-24),Vector2(-12,-19),Vector2(-12,-18),Vector2(-12,-17),Vector2(-11,-20),Vector2(-10,-20),Vector2(-9,-20),Vector2(-8,-20),Vector2(-7,-20),Vector2(-7,-21),Vector2(-7,-22),Vector2(-7,-23),Vector2(-7,-24),Vector2(-32,7),Vector2(-33,7),Vector2(-34,7),Vector2(-35,7),Vector2(-36,7),Vector2(-37,7)},
        Hard = {Vector2(6,1),Vector2(6,0),Vector2(6,-1),Vector2(6,-2),Vector2(6,-3),Vector2(-7,-2),Vector2(-7,-3),Vector2(-7,-4),Vector2(-7,-5),Vector2(-7,-6),Vector2(-12,-9),Vector2(-12,-10),Vector2(-12,-11),Vector2(-12,-12),Vector2(-12,-13),Vector2(-16,-15),Vector2(-16,-16),Vector2(-16,-17),Vector2(-16,-18),Vector2(-16,-19),Vector2(-12,-20),Vector2(-36,5),Vector2(-36,4),Vector2(-36,3),Vector2(-40,1),Vector2(-40,0),Vector2(-40,-1),Vector2(-40,-2),Vector2(-35,-1),Vector2(-35,-2),Vector2(-35,-3),Vector2(-35,-4),Vector2(-35,-5)},
        Kill = {Vector2(-31,7),Vector2(-30,7),Vector2(-29,7),Vector2(-28,7),Vector2(-27,7),Vector2(-26,7),Vector2(-25,7),Vector2(-24,7),Vector2(-23,7),Vector2(-22,7),Vector2(-21,7),Vector2(-20,7),Vector2(-19,7),Vector2(-18,7),Vector2(-17,7),Vector2(-16,7),Vector2(-15,7),Vector2(-14,7),Vector2(-13,7),Vector2(-12,7),Vector2(-11,7),Vector2(-10,7),Vector2(-9,7),Vector2(-8,7),Vector2(-7,7),Vector2(-6,7),Vector2(-5,7),Vector2(-4,7),Vector2(-3,7),Vector2(-2,7),Vector2(-1,7),Vector2(0,7),Vector2(1,7),Vector2(2,7),Vector2(3,7),Vector2(4,7),Vector2(5,7),Vector2(6,7),Vector2(7,7),Vector2(8,7),Vector2(9,7),Vector2(10,7),Vector2(11,7),Vector2(12,7),Vector2(13,7),Vector2(14,7),Vector2(15,7),Vector2(16,7),Vector2(17,7),Vector2(18,7),Vector2(19,7),Vector2(20,7),Vector2(21,7),Vector2(-10,-11),Vector2(-10,-12),Vector2(-38,4.5),Vector2(-38.5,3),Vector2(-35.5,0.5),Vector2(-35.5,2),Vector2(-35,5),Vector2(-35,4),Vector2(-35,3),Vector2(-38,0.5),Vector2(-41,1),Vector2(-38,-0.5),Vector2(-37,-3),Vector2(-37,-4.5),Vector2(-41,0),Vector2(-41,-1),Vector2(-41,-2),Vector2(-43,-3.5),Vector2(-42,-3.5),Vector2(-41,-3.5),Vector2(-40,-3.5),Vector2(-39,-3.5),Vector2(-39,-6),Vector2(-38,-5.5),Vector2(-35,-7),Vector2(-39,6),Vector2(-38.5,7.5),Vector2(-39.5,3),Vector2(-40.5,2.5)},
        Checkpoint = {Vector2(0,0),Vector2(-4,-3),Vector2(-14,-15),Vector2(-33,5),Vector2(-39,-2)},
        Pie = {Vector2(-9,-22)},
        Secret = {Vector2(-39,-4.5)}},
        {Steel = {Vector2(-2,-1),Vector2(-2,0),Vector2(-2,1),Vector2(-2,2),Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(4,2),Vector2(5,2),Vector2(6,2),Vector2(7,2),Vector2(8,2),Vector2(9,2),Vector2(10,2),Vector2(10,1),Vector2(10,0),Vector2(10,-1),Vector2(10,-2),Vector2(13,-10),Vector2(12,-10),Vector2(11,-10),Vector2(10,-10),Vector2(10,-11),Vector2(10,-12),Vector2(10,-13),Vector2(10,-14),Vector2(7,-7),Vector2(6,-7),Vector2(5,-7),Vector2(4,-7),Vector2(3,-7),Vector2(-10,7),Vector2(-11,7),Vector2(-12,7),Vector2(-13,7),Vector2(-14,7),Vector2(-15,7),Vector2(-16,7),Vector2(-17,7),Vector2(-18,7),Vector2(-19,7),Vector2(-19,-6),Vector2(-20,-6),Vector2(-21,-6),Vector2(-22,-6),Vector2(-23,-6),Vector2(-24,-6),Vector2(-25,-6),Vector2(-26,-6),Vector2(-28,-12),Vector2(-29,-12),Vector2(-30,-12),Vector2(-31,-12),Vector2(-32,-12)},
        Brittle = {Vector2(2,1),Vector2(2,0),Vector2(2,-1),Vector2(2,-2),Vector2(2,-3),Vector2(13,-4),Vector2(13,-5),Vector2(13,-6),Vector2(13,-7),Vector2(13,-8),Vector2(13,-9),Vector2(10,-8),Vector2(10,-9),Vector2(4,-8),Vector2(4,-9),Vector2(4,-10),Vector2(4,-11),Vector2(4,-12),Vector2(4,-13),Vector2(4,-14),Vector2(-26,-9),Vector2(-22,-12),Vector2(-22,-13),Vector2(-24.5,-14),Vector2(-19,4),Vector2(-15,1),Vector2(-19,-2),Vector2(-15,-5)},
        Kill = {Vector2(-5,-2),Vector2(-4,-2),Vector2(-3,-2),Vector2(-2,-2),Vector2(-1,-2),Vector2(0,-2),Vector2(1,-2),Vector2(11,-1),Vector2(12,-1),Vector2(13,-1),Vector2(14,-1),Vector2(15,-1),Vector2(16,-1),Vector2(17,-1),Vector2(18,-1),Vector2(0,7),Vector2(-1,7),Vector2(-2,7),Vector2(-3,7),Vector2(-4,7),Vector2(-5,7),Vector2(-6,7),Vector2(-7,7),Vector2(-8,7),Vector2(-9,7),Vector2(3,-8),Vector2(3,-9),Vector2(3,-10),Vector2(3,-11),Vector2(3,-12),Vector2(3,-13),Vector2(3,-14),Vector2(3,-15),Vector2(4,-15),Vector2(10,-15),Vector2(-24,-12.5),Vector2(-21.99,-10.5),Vector2(-22,-15),Vector2(-26.01,-7.5),Vector2(-26.01,-10.5),Vector2(-24.51,-15.5),Vector2(-27,-9),Vector2(-19.01,2.5),Vector2(-20,4),Vector2(-19.01,5.5),Vector2(-14.99,-0.5),Vector2(-14,1),Vector2(-14.99,2.5),Vector2(-19.01,-3.5),Vector2(-20,-2),Vector2(-19.01,-0.5),Vector2(-14.99,-6.5),Vector2(-14,-5),Vector2(-14.99,-3.5),Vector2(-19,-5),Vector2(-19,1),Vector2(-32,-13),Vector2(-32,-14),Vector2(-32,-15),Vector2(-32,-16)},
        Checkpoint = {Vector2(0,0),Vector2(10,-4),Vector2(6,-9),Vector2(-11,5),Vector2(-20,-8)},
        Pie = {Vector2(8,-15)},
        Secret = {Vector2(-29,-14)}},
        {Steel = {Vector2(-5,2),Vector2(-4,2),Vector2(-3,2),Vector2(-2,2),Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(1,-9),Vector2(17,7),Vector2(18,7),Vector2(19,7),Vector2(21,7),Vector2(22,7),Vector2(23,7)},
        Rocky = {Vector2(2,1),Vector2(2,0),Vector2(2,-1),Vector2(2,-2),Vector2(2,-3),Vector2(1,-6),Vector2(2,-6),Vector2(3,-6),Vector2(2,-9),Vector2(3,-9),Vector2(-8,-10),Vector2(24,1),Vector2(24,-3),Vector2(20,7)},
        Kill = {Vector2(-25,7),Vector2(-24,7),Vector2(-23,7),Vector2(-22,7),Vector2(-21,7),Vector2(-20,7),Vector2(-19,7),Vector2(-18,7),Vector2(-17,7),Vector2(-16,7),Vector2(-15,7),Vector2(-14,7),Vector2(-13,7),Vector2(-12,7),Vector2(-11,7),Vector2(-10,7),Vector2(-9,7),Vector2(-8,7),Vector2(-7,7),Vector2(-6,7),Vector2(-5,7),Vector2(-4,7),Vector2(-3,7),Vector2(-2,7),Vector2(-1,7),Vector2(0,7),Vector2(1,7),Vector2(2,7),Vector2(3,7),Vector2(4,7),Vector2(5,7),Vector2(6,7),Vector2(7,7),Vector2(8,7),Vector2(9,7),Vector2(10,7),Vector2(11,7),Vector2(12,7),Vector2(13,7),Vector2(14,7),Vector2(15,7),Vector2(16,7),Vector2(24,6),Vector2(24,5),Vector2(24,4),Vector2(24,3),Vector2(24,2),Vector2(23,2),Vector2(24,7),Vector2(25,7),Vector2(26,7),Vector2(27,7),Vector2(28,7),Vector2(29,7),Vector2(30,7),Vector2(31,7),Vector2(32,7),Vector2(33,7),Vector2(34,7),Vector2(35,7),Vector2(36,7),Vector2(37,7),Vector2(38,7),Vector2(39,7),Vector2(40,7),Vector2(41,7),Vector2(42,7),Vector2(43,7),Vector2(44,7),Vector2(45,7),Vector2(46,7),Vector2(47,7),Vector2(4.5,-9),Vector2(30,-9),Vector2(32,-9)},
        Checkpoint = {Vector2(0,0),Vector2(2,-8),Vector2(18,5),Vector2(24,-1),Vector2(24,-5)},
        Pie = {Vector2(-5,-14.5)},
        Secret = {Vector2(31,-10.5)}},
        {Steel = {Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(-0.5,-29),Vector2(0.5,-29),Vector2(1.5,-29),Vector2(5,-29),Vector2(10,-29),Vector2(11,-29),Vector2(12,-29),Vector2(13,-29),Vector2(14,-29),Vector2(15,-29),Vector2(16,-29),Vector2(17,-29),Vector2(18,-29),Vector2(19,-29),Vector2(20,-29),Vector2(15,-33),Vector2(14,-33),Vector2(13,-33),Vector2(12,-34),Vector2(11,-35),Vector2(10,-36),Vector2(9,-36),Vector2(8,-36)},
        Ice = {Vector2(2,-3),Vector2(-2,-7),Vector2(2,-11),Vector2(-2,-15),Vector2(-6,-16),Vector2(-10,-17),Vector2(-10,-26),Vector2(-4,-30),Vector2(0.5,-36),Vector2(24,-35)},
        Kill = {Vector2(-35,7),Vector2(-34,7),Vector2(-33,7),Vector2(-32,7),Vector2(-31,7),Vector2(-30,7),Vector2(-29,7),Vector2(-28,7),Vector2(-27,7),Vector2(-26,7),Vector2(-25,7),Vector2(-24,7),Vector2(-23,7),Vector2(-22,7),Vector2(-21,7),Vector2(-20,7),Vector2(-19,7),Vector2(-18,7),Vector2(-17,7),Vector2(-16,7),Vector2(-15,7),Vector2(-14,7),Vector2(-13,7),Vector2(-12,7),Vector2(-11,7),Vector2(-10,7),Vector2(-9,7),Vector2(-8,7),Vector2(-7,7),Vector2(-6,7),Vector2(-5,7),Vector2(-4,7),Vector2(-3,7),Vector2(-2,7),Vector2(-1,7),Vector2(0,7),Vector2(1,7),Vector2(2,7),Vector2(3,7),Vector2(4,7),Vector2(5,7),Vector2(6,7),Vector2(7,7),Vector2(8,7),Vector2(9,7),Vector2(10,7),Vector2(11,7),Vector2(12,7),Vector2(13,7),Vector2(14,7),Vector2(15,7),Vector2(16,7),Vector2(17,7),Vector2(18,7),Vector2(19,7),Vector2(20,7),Vector2(21,7),Vector2(22,7),Vector2(23,7),Vector2(24,7),Vector2(25,7),Vector2(26,7),Vector2(27,7),Vector2(28,7),Vector2(29,7),Vector2(30,7),Vector2(31,7),Vector2(32,7),Vector2(33,7),Vector2(34,7),Vector2(35,7),Vector2(36,7),Vector2(37,7),Vector2(38,7),Vector2(39,7),Vector2(40,7),Vector2(41,7),Vector2(42,7),Vector2(43,7),Vector2(44,7),Vector2(45,7),Vector2(46,7),Vector2(47,7),Vector2(48,7),Vector2(49,7),Vector2(50,7),Vector2(-4,-29),Vector2(-4,-31.5),Vector2(-3,-29),Vector2(-3,-31.5),Vector2(2.5,-29),Vector2(2.5,-30),Vector2(2.5,-31),Vector2(2.5,-32),Vector2(2.5,-33),Vector2(2.5,-34),Vector2(2.5,-35),Vector2(2.5,-36.5),Vector2(7.5,-29),Vector2(7.5,-30),Vector2(7.5,-31),Vector2(7.5,-32),Vector2(7.5,-33),Vector2(24,-36),Vector2(25,-35),Vector2(25,-36),Vector2(22,-33.5),Vector2(21,-34.5),Vector2(20,-35.5),Vector2(19,-35),Vector2(18,-34.5),Vector2(7,-36),Vector2(7,-37),Vector2(7,-38),Vector2(7,-39)},
        Checkpoint = {Vector2(0,0),Vector2(-10,-28),Vector2(0.5,-31),Vector2(20,-31)},
        Pie = {Vector2(-18,-16)},
        Secret = {Vector2(9,-38)}},
        {Steel = {Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,-9),Vector2(2,-11),Vector2(2,-12),Vector2(2,-13),Vector2(2,-14),Vector2(3,-14),Vector2(4,-14),Vector2(5,-14),Vector2(6,-14),Vector2(7,-14),Vector2(2,-15),Vector2(2,-16),Vector2(2,-17),Vector2(2,-18),Vector2(-14,7),Vector2(-13,7),Vector2(-12,7),Vector2(-15,-4),Vector2(-15,-6),Vector2(-15,-7),Vector2(-15,-8),Vector2(-15,-9),Vector2(-16,-9),Vector2(-17,-9),Vector2(-18,-9),Vector2(-19,-9),Vector2(-20,-9),Vector2(-15,-10),Vector2(-15,-11),Vector2(-15,-12),Vector2(-15,-13)},
        Normal = {Vector2(3,-3),Vector2(2,-10),Vector2(8,-14)},
        Rocky= {Vector2(-16,2),Vector2(-15,-5),Vector2(-21,-9)},
        Kill = {Vector2(-30,7),Vector2(-29,7),Vector2(-28,7),Vector2(-27,7),Vector2(-26,7),Vector2(-25,7),Vector2(-24,7),Vector2(-23,7),Vector2(-22,7),Vector2(-21,7),Vector2(-20,7),Vector2(-19,7),Vector2(-18,7),Vector2(-17,7),Vector2(-16,7),Vector2(-15,7),Vector2(-11,7),Vector2(-10,7),Vector2(-9,7),Vector2(-8,7),Vector2(-7,7),Vector2(-6,7),Vector2(-5,7),Vector2(-4,7),Vector2(-3,7),Vector2(-2,7),Vector2(-1,7),Vector2(0,7),Vector2(1,7),Vector2(2,7),Vector2(3,7),Vector2(4,7),Vector2(5,7),Vector2(6,7),Vector2(7,7),Vector2(8,7),Vector2(9,7),Vector2(10,7),Vector2(11,7),Vector2(12,7),Vector2(13,7),Vector2(14,7),Vector2(15,7),Vector2(16,7),Vector2(17,7),Vector2(18,7),Vector2(19,7),Vector2(20,7),Vector2(21,7),Vector2(22,7),Vector2(23,7),Vector2(24,7),Vector2(25,7)},
        Checkpoint = {Vector2(0,0),Vector2(-13,5)},
        Pie = {Vector2(4,-16)},
        Secret = {Vector2(-17,-11)}},
        {Steel = {Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(3,-4),Vector2(3,-5),Vector2(3,-6),Vector2(2,-6),Vector2(1,-6),Vector2(0,-6),Vector2(0,-5),Vector2(3,-13),Vector2(3,-14),Vector2(3,-15),Vector2(3,-16),Vector2(13,-19),Vector2(14,-19),Vector2(15,-19),Vector2(16,-19),Vector2(16,-20),Vector2(16,-21),Vector2(16,-22),Vector2(16,-23),Vector2(-5.5,-24),Vector2(-8.5,-24),Vector2(-9.5,-24),Vector2(-10.5,-24),Vector2(-11.5,-24),Vector2(-5.5,-25),Vector2(-5.5,-26),Vector2(-5.5,-27),Vector2(-5.5,-28),Vector2(-11.5,-25),Vector2(-11.5,-26),Vector2(-11.5,-27),Vector2(-11.5,-28),Vector2(-10.5,-28),Vector2(-9.5,-28),Vector2(-9.5,-29),Vector2(-8.5,-29),Vector2(-8.5,-30),Vector2(-8.5,-31),Vector2(-8.5,-32),Vector2(-4.5,-28),Vector2(-3.5,-28),Vector2(4,-31),Vector2(5,-31),Vector2(6,-31),Vector2(7,-31),Vector2(8,-31),Vector2(9,-31),Vector2(9,-32),Vector2(9,-33),Vector2(9,-34),Vector2(9,-35)},
        Chunk = {Vector2(3,-2),Vector2(3,-3),Vector2(0,-3),Vector2(0,-4),Vector2(-3,-4),Vector2(-3,-5),Vector2(3,-7),Vector2(3,-8),Vector2(3,-9),Vector2(3,-10),Vector2(3,-11),Vector2(3,-12),Vector2(-5,-14),Vector2(-5,-15),Vector2(12,-17),Vector2(12,-18),Vector2(12,-19),Vector2(-7,-23),Vector2(-7,-28),Vector2(2,-32)},
        Kill = {Vector2(-4,-2),Vector2(-3,-2),Vector2(-2,-2),Vector2(-1,-2),Vector2(0,-2),Vector2(1,-10),Vector2(1,-11),Vector2(4,-6),Vector2(5,-6),Vector2(-5,-16),Vector2(-6,-16),Vector2(-7,-16),Vector2(-8,-16),Vector2(-8,-15),Vector2(-8,-14),Vector2(-8,-13),Vector2(-7,-13),Vector2(-6,-13),Vector2(-5,-13),Vector2(-4,-12),Vector2(-3,-12),Vector2(-17,7),Vector2(-16,7),Vector2(-15,7),Vector2(-14,7),Vector2(-13,7),Vector2(-12,7),Vector2(-11,7),Vector2(-10,7),Vector2(-9,7),Vector2(-8,7),Vector2(-7,7),Vector2(-6,7),Vector2(-5,7),Vector2(-4,7),Vector2(-3,7),Vector2(-2,7),Vector2(-1,7),Vector2(0,7),Vector2(1,7),Vector2(2,7),Vector2(3,7),Vector2(4,7),Vector2(5,7),Vector2(6,7),Vector2(7,7),Vector2(8,7),Vector2(9,7),Vector2(10,7),Vector2(11,7),Vector2(12,7),Vector2(13,7),Vector2(14,7),Vector2(15,7),Vector2(16,7),Vector2(17,7),Vector2(18,7),Vector2(19,7),Vector2(20,7),Vector2(12,-8),Vector2(12,-9),Vector2(12,-10),Vector2(12,-11),Vector2(12,-12),Vector2(12,-13),Vector2(12,-14),Vector2(12,-15),Vector2(12,-16),Vector2(2,-33.5),Vector2(2,-30.5),Vector2(3,-30.5)},
        Checkpoint = {Vector2(0,0),Vector2(1,-8),Vector2(14,-21),Vector2(-9.5,-26),Vector2(-4.5,-30)},
        Pie = {Vector2(-6.5,-14.5)},
        Secret = {Vector2(7,-33)}},
        {Steel = {Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(3,-4),Vector2(3,-5),Vector2(3,-6),Vector2(2,-6),Vector2(1,-6),Vector2(0,-6),Vector2(0,-5),Vector2(-18,7),Vector2(-17,7),Vector2(-16,7),Vector2(-15,7),Vector2(-14,7),Vector2(-25,0),Vector2(-26,0),Vector2(-27,0),Vector2(-30,-3),Vector2(-29,-3),Vector2(-28,-3),Vector2(-28,-4),Vector2(-28,-5)},
        Organic = {Vector2(3,1),Vector2(3,0),Vector2(3,-1),Vector2(3,-2),Vector2(3,-3),Vector2(0,-4),Vector2(0,-3),Vector2(-3,-5),Vector2(0,-13),Vector2(4,-11),Vector2(-19,0),Vector2(-28,-1),Vector2(-29,-1),Vector2(-30,-1),Vector2(-31,-1),Vector2(-32,-1),Vector2(-33,-1),Vector2(-31,-2),Vector2(-31,-3),Vector2(-28,-8)},
        Kill = {Vector2(-4,-2),Vector2(-3,-2),Vector2(-2,-2),Vector2(-1,-2),Vector2(0,-2),Vector2(1,-10),Vector2(0,-10),Vector2(0,-15),Vector2(4,-13),Vector2(-2.5,-10),Vector2(-2.5,-9),Vector2(-2.5,-8),Vector2(-3.5,-7),Vector2(-4.5,-7),Vector2(-5.5,-7),Vector2(-6.5,-8),Vector2(-6.5,-9),Vector2(-6.5,-10),Vector2(-6.5,-11),Vector2(-6.5,-12),Vector2(-6.5,-13),Vector2(-6.5,-14),Vector2(-6.5,-15),Vector2(-6.5,-16),Vector2(-6.5,-17),Vector2(-13,7),Vector2(-12,7),Vector2(-11,7),Vector2(-10,7),Vector2(-9,7),Vector2(-8,7),Vector2(-7,7),Vector2(-6,7),Vector2(-5,7),Vector2(-4,7),Vector2(-3,7),Vector2(-2,7),Vector2(-1,7),Vector2(0,7),Vector2(1,7),Vector2(2,7),Vector2(3,7),Vector2(4,7),Vector2(5,7),Vector2(6,7),Vector2(7,7),Vector2(8,7),Vector2(9,7),Vector2(10,7),Vector2(11,7),Vector2(12,7),Vector2(13,7),Vector2(14,7),Vector2(15,7),Vector2(16,7),Vector2(17,7),Vector2(18,7),Vector2(19,7),Vector2(-19,7),Vector2(-19,6),Vector2(-19,5),Vector2(-19,4),Vector2(-19,3),Vector2(-19,2),Vector2(-20,2),Vector2(-20,1),Vector2(-21,1),Vector2(-21,0),Vector2(-22,0),Vector2(-23,0),Vector2(-24,0),Vector2(-28,-2),Vector2(-29,-2),Vector2(-30,-2),Vector2(-28,0),Vector2(-29,0),Vector2(-30,0),Vector2(-31,0),Vector2(-32,0),Vector2(-33,0),Vector2(-34,0),Vector2(-34,-1),Vector2(-34,-2),Vector2(-33,-2.5),Vector2(-28.5,-6.5),Vector2(-35,0),Vector2(-36,0),Vector2(-37,0),Vector2(-38,0),Vector2(-39,0),Vector2(-40,0),Vector2(-41,0),Vector2(-42,0),Vector2(-43,0),Vector2(-44,0),Vector2(-45,0),Vector2(-46,0),Vector2(-47,0),Vector2(-48,0),Vector2(-49,0),Vector2(-50,0),Vector2(-26.5,-8),Vector2(-26.5,-9),Vector2(-26.5,-10),Vector2(-26.5,-11),Vector2(-26.5,-12),Vector2(-26.5,-13),Vector2(-26.5,-14),Vector2(-26.5,-15)},
        Checkpoint = {Vector2(0,0),Vector2(1,-8),Vector2(-16,5),Vector2(-26,-2),Vector2(-30,-5)},
        Pie = {Vector2(-4.5,-9)},
        Secret = {Vector2(-30,-16)}},
        {Steel = {Vector2(8,2),Vector2(9,2),Vector2(10,2),Vector2(11,2),Vector2(12,2),Vector2(9,-5),Vector2(9,-6),Vector2(10,-6),Vector2(11,-6),Vector2(12,-6),Vector2(12,-5),Vector2(12,-4),Vector2(13,-6),Vector2(16,-6),Vector2(16,-7),Vector2(16,-8),Vector2(16,-9),Vector2(16,-10),Vector2(15,-10),Vector2(14,-10),Vector2(13,-10),Vector2(17.5,16),Vector2(18.5,16),Vector2(19.5,16),Vector2(20.5,16),Vector2(29,13)},
        Dirt = {Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(4,2),Vector2(5,2),Vector2(6,2),Vector2(7,2),Vector2(12,1),Vector2(12,0),Vector2(12,-1),Vector2(12,-2),Vector2(12,-3),Vector2(9,-3),Vector2(9,-4),Vector2(6,-5),Vector2(14,-6),Vector2(15,-6),Vector2(21.5,16),Vector2(24.5,16),Vector2(27.5,16),Vector2(30,13),Vector2(31,13),Vector2(33.5,23),Vector2(35,20),Vector2(33,17)},
        Kill = {Vector2(-2,2),Vector2(-2,1),Vector2(-2,0),Vector2(-2,-1),Vector2(-2,-2),Vector2(-1,-2),Vector2(0,-2),Vector2(1,-2),Vector2(2,-2),Vector2(3,-2),Vector2(4,-2),Vector2(5,-2),Vector2(6,-2),Vector2(7,-2),Vector2(8,-2),Vector2(9,-2),Vector2(13,-4),Vector2(16,-4),Vector2(13,-2),Vector2(16,-2),Vector2(13,0),Vector2(16,0),Vector2(13,2),Vector2(13,4),Vector2(13,6),Vector2(16,6),Vector2(13,8),Vector2(14,8),Vector2(15,8),Vector2(16,8),Vector2(0,8),Vector2(1,8),Vector2(2,8),Vector2(3,8),Vector2(4,8),Vector2(5,8),Vector2(6,8),Vector2(7,8),Vector2(8,8),Vector2(9,8),Vector2(10,8),Vector2(11,8),Vector2(12,8),Vector2(-15,8),Vector2(-14,8),Vector2(-13,8),Vector2(-12,8),Vector2(-11,8),Vector2(-10,8),Vector2(-9,8),Vector2(-8,8),Vector2(-7,8),Vector2(-6,8),Vector2(-5,8),Vector2(-4,8),Vector2(-3,8),Vector2(-2,8),Vector2(-1,8),Vector2(20,8),Vector2(21,8),Vector2(22,8),Vector2(23,8),Vector2(24,8),Vector2(25,8),Vector2(26,8),Vector2(27,8),Vector2(28,8),Vector2(16.5,10),Vector2(19.5,10),Vector2(17,12),Vector2(19.5,12),Vector2(20.5,13),Vector2(21,14),Vector2(22,14),Vector2(23,14),Vector2(24,14),Vector2(25,14),Vector2(29,16),Vector2(29,15),Vector2(29,14),Vector2(16.5,16),Vector2(15.5,16),Vector2(14.5,16),Vector2(13.5,16),Vector2(12.5,16),Vector2(11.5,16),Vector2(10.5,16),Vector2(9.5,16),Vector2(8.5,16),Vector2(23,16),Vector2(20,17),Vector2(20,18),Vector2(20,19),Vector2(20,20),Vector2(20,21),Vector2(20,22),Vector2(20,23),Vector2(21,23),Vector2(22,23),Vector2(23,23),Vector2(24,23),Vector2(25,23),Vector2(26,23),Vector2(27,23),Vector2(28,23),Vector2(29,23),Vector2(29,22),Vector2(29,21),Vector2(29,20),Vector2(29,19),Vector2(29,18),Vector2(29,17),Vector2(30,25),Vector2(29,25),Vector2(29,24),Vector2(31,25),Vector2(32,25),Vector2(32,24),Vector2(32,23),Vector2(32,19.5),Vector2(32,18),Vector2(32,17),Vector2(32,16),Vector2(32,15),Vector2(32,14),Vector2(32,13),Vector2(32,12),Vector2(32,11),Vector2(32,10),Vector2(32,9),Vector2(32,8),Vector2(31,8),Vector2(30,8),Vector2(29,8),Vector2(36,23),Vector2(36,22),Vector2(36,21),Vector2(36,20),Vector2(36,19),Vector2(36,18),Vector2(36,17),Vector2(36,16),Vector2(36,15),Vector2(33,24),Vector2(34,24),Vector2(35,24),Vector2(36,24),Vector2(33,8),Vector2(34,8),Vector2(35,8),Vector2(36,8),Vector2(36,9),Vector2(36,10),Vector2(36,11),Vector2(36,12),Vector2(36,13),Vector2(36,14)},
        Checkpoint = {Vector2(0,0),Vector2(10,-8),Vector2(18.5,14),Vector2(30,11),Vector2(33.5,21)},
        Pie = {Vector2(18,2)},
        Secret = {Vector2(35,9)}},
        {Steel = {Vector2(-2,-2),Vector2(-1,-2),Vector2(0,-2),Vector2(1,-2),Vector2(-2,-1),Vector2(-2,0),Vector2(-2,1),Vector2(-2,2),Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,2),Vector2(4,2),Vector2(5,2),Vector2(2,-2),Vector2(3,-2),Vector2(4,-2),Vector2(5,-2),Vector2(6,-2),Vector2(7,-2),Vector2(8,-2),Vector2(9,-2),Vector2(6,2),Vector2(7,2),Vector2(8,2),Vector2(9,2),Vector2(10,2),Vector2(10,-1),Vector2(10,-2),Vector2(21,-1),Vector2(21,-2),Vector2(21,2),Vector2(22,2),Vector2(23,2),Vector2(24,2),Vector2(25,2),Vector2(26,2),Vector2(27,2),Vector2(28,2),Vector2(11,-2),Vector2(12,-2),Vector2(13,-2),Vector2(14,-2),Vector2(15,-2),Vector2(16,-2),Vector2(17,-2),Vector2(18,-2),Vector2(19,-2),Vector2(20,-2),Vector2(11,-1),Vector2(12,-1),Vector2(13,-1),Vector2(14,-1),Vector2(15,-1),Vector2(16,-1),Vector2(17,-1),Vector2(18,-1),Vector2(19,-1),Vector2(20,-1),Vector2(29,-4),Vector2(30,-4),Vector2(31,-4),Vector2(32,-4)},
        Brittle = {Vector2(26,1),Vector2(27,1),Vector2(26,0),Vector2(27,0),Vector2(26,-1),Vector2(27,-1),Vector2(26,-2),Vector2(27,-2),Vector2(26,-3),Vector2(27,-3),Vector2(26,-4),Vector2(27,-4),Vector2(33,-4),Vector2(34,-4),Vector2(33,-3),Vector2(34,-3),Vector2(33,-2),Vector2(34,-2),Vector2(33,-1),Vector2(34,-1),Vector2(33,0),Vector2(34,0)},
        Fragile = {Vector2(3,1),Vector2(4,1),Vector2(5,1),Vector2(3,0),Vector2(4,0),Vector2(5,0),Vector2(3,-1),Vector2(4,-1),Vector2(5,-1),Vector2(11,1),Vector2(12,1),Vector2(13,1),Vector2(14,1),Vector2(15,1),Vector2(16,1),Vector2(17,1),Vector2(18,1),Vector2(19,1),Vector2(20,1),Vector2(11,2),Vector2(12,2),Vector2(13,2),Vector2(14,2),Vector2(15,2),Vector2(16,2),Vector2(17,2),Vector2(18,2),Vector2(19,2),Vector2(20,2),Vector2(61,-16),Vector2(62,-16),Vector2(63,-16),Vector2(46,-13),Vector2(47,-13),Vector2(48,-13),Vector2(49,-13),Vector2(53,-14),Vector2(56,-15),Vector2(65,-14),Vector2(66,-14),Vector2(67,-14),Vector2(73,-14),Vector2(74,-14),Vector2(75,-14),Vector2(76,-14),Vector2(81,-14),Vector2(85,-14),Vector2(86,-14),Vector2(87,-14),Vector2(91,-15),Vector2(92,-15),Vector2(93,-15),Vector2(95,-15),Vector2(96,-15),Vector2(100,-15),Vector2(101,-15),Vector2(102,-15),Vector2(103,-15),Vector2(101,-18),Vector2(102,-18),Vector2(103,-18),Vector2(104,-18),Vector2(105,-18),Vector2(105,-17),Vector2(105,-16),Vector2(105,-15),Vector2(106,-15),Vector2(107,-15),Vector2(108,-15),Vector2(95,-30),Vector2(94,-30),Vector2(93,-30),Vector2(92,-30),Vector2(92,-37),Vector2(92,-38),Vector2(92,-39),Vector2(92,-40),Vector2(92,-41),Vector2(101,-19),Vector2(101,-20),Vector2(101,-21),Vector2(101,-22),Vector2(101,-23),Vector2(96,-30),Vector2(92,-32),Vector2(92,-33),Vector2(92,-34),Vector2(92,-35),Vector2(92,-36),Vector2(104,-15)},
        Kill = {Vector2(11,3),Vector2(12,3),Vector2(13,3),Vector2(14,3),Vector2(15,3),Vector2(16,3),Vector2(17,3),Vector2(18,3),Vector2(19,3),Vector2(20,3),Vector2(10,0),Vector2(11,0),Vector2(12,0),Vector2(13,0),Vector2(14,0),Vector2(15,0),Vector2(16,0),Vector2(17,0),Vector2(18,0),Vector2(19,0),Vector2(20,0),Vector2(21,0),Vector2(25,0),Vector2(25,-1),Vector2(25,-2),Vector2(25,-3),Vector2(25,-4),Vector2(28,1),Vector2(28,0),Vector2(28,-1),Vector2(28,-2),Vector2(28,-3),Vector2(28,-4),Vector2(25,-7),Vector2(26,-7),Vector2(27,-7),Vector2(28,-7),Vector2(29,-7),Vector2(33,-7),Vector2(34,-7),Vector2(35,-7),Vector2(35,-6),Vector2(35,-5),Vector2(35,-4),Vector2(32,-3),Vector2(35,-3),Vector2(32,-2),Vector2(35,-2),Vector2(32,-1),Vector2(35,-1),Vector2(32,0),Vector2(35,0),Vector2(32,1),Vector2(35,1),Vector2(32,2),Vector2(35,2),Vector2(32,3),Vector2(33,3),Vector2(34,3),Vector2(35,3),Vector2(-16,7),Vector2(-15,7),Vector2(-14,7),Vector2(-13,7),Vector2(-12,7),Vector2(-11,7),Vector2(-10,7),Vector2(-9,7),Vector2(-8,7),Vector2(-7,7),Vector2(-6,7),Vector2(-5,7),Vector2(-4,7),Vector2(-3,7),Vector2(-2,7),Vector2(-1,7),Vector2(0,7),Vector2(1,7),Vector2(44,-11),Vector2(45,-11),Vector2(51,-11),Vector2(52,-11),Vector2(53,-11),Vector2(54,-11),Vector2(55,-11),Vector2(56,-11),Vector2(57,-11),Vector2(58,-11),Vector2(59,-11),Vector2(59,-12),Vector2(59,-13),Vector2(59,-14),Vector2(59,-15),Vector2(59,-16),Vector2(60,-16),Vector2(45,-13),Vector2(45,-12),Vector2(46,-12),Vector2(47,-12),Vector2(48,-12),Vector2(49,-12),Vector2(50,-12),Vector2(46,-11),Vector2(47,-11),Vector2(48,-11),Vector2(49,-11),Vector2(50,-11),Vector2(64,-15),Vector2(64,-16),Vector2(64,-17),Vector2(64,-18),Vector2(70,-15),Vector2(76,-17),Vector2(77,-17),Vector2(78,-17),Vector2(79,-17),Vector2(80,-17),Vector2(81,-17),Vector2(87,-13),Vector2(88,-13),Vector2(89,-13),Vector2(90,-13),Vector2(91,-13),Vector2(91,-14),Vector2(96,-18),Vector2(97,-15),Vector2(98,-15),Vector2(98,-16),Vector2(99,-15),Vector2(100,-18),Vector2(64,-14),Vector2(68,-14),Vector2(69,-14),Vector2(70,-14),Vector2(71,-14),Vector2(72,-14),Vector2(82,-14),Vector2(83,-14),Vector2(84,-14),Vector2(87,-16),Vector2(87,-17),Vector2(87,-18),Vector2(91,-17),Vector2(91,-18),Vector2(91,-19),Vector2(96,-19),Vector2(97,-19),Vector2(98,-19),Vector2(99,-19),Vector2(100,-19),Vector2(94,-15),Vector2(98,-28),Vector2(98,-29),Vector2(109,-15),Vector2(110,-15),Vector2(111,-15),Vector2(112,-15),Vector2(113,-15),Vector2(114,-15),Vector2(114,-16),Vector2(114,-17),Vector2(114,-18),Vector2(114,-19),Vector2(114,-20),Vector2(96,-26),Vector2(96,-27),Vector2(96,-28),Vector2(96,-29),Vector2(96,-37),Vector2(96,-36),Vector2(96,-35),Vector2(96,-34),Vector2(97,-37),Vector2(98,-37),Vector2(99,-37),Vector2(100,-37),Vector2(101,-37),Vector2(101,-38),Vector2(101,-39),Vector2(101,-40),Vector2(101,-41),Vector2(44,-7),Vector2(45,-7),Vector2(46,-7),Vector2(47,-7),Vector2(48,-7),Vector2(49,-7),Vector2(50,-7),Vector2(51,-7),Vector2(52,-7),Vector2(53,-7),Vector2(54,-7),Vector2(55,-7),Vector2(56,-7),Vector2(57,-7),Vector2(58,-7),Vector2(59,-7),Vector2(60,-7),Vector2(61,-7),Vector2(62,-7),Vector2(63,-7),Vector2(64,-7),Vector2(65,-7),Vector2(66,-7),Vector2(67,-7),Vector2(68,-7),Vector2(69,-7),Vector2(70,-7),Vector2(71,-7),Vector2(72,-7),Vector2(73,-7),Vector2(74,-7),Vector2(75,-7),Vector2(76,-7),Vector2(77,-7),Vector2(78,-7),Vector2(79,-7),Vector2(80,-7),Vector2(81,-7),Vector2(82,-7),Vector2(83,-7),Vector2(84,-7),Vector2(85,-7),Vector2(86,-7),Vector2(87,-7),Vector2(88,-7),Vector2(89,-7),Vector2(90,-7),Vector2(91,-7),Vector2(92,-7),Vector2(93,-7),Vector2(94,-7),Vector2(95,-7),Vector2(96,-7),Vector2(97,-7),Vector2(98,-7),Vector2(99,-7),Vector2(100,-7),Vector2(101,-7),Vector2(102,-7),Vector2(103,-7),Vector2(104,-7),Vector2(105,-7),Vector2(106,-7),Vector2(107,-7),Vector2(108,-7),Vector2(109,-7),Vector2(110,-7),Vector2(111,-7),Vector2(112,-7),Vector2(113,-7),Vector2(114,-7),Vector2(115,-7),Vector2(116,-7),Vector2(117,-7),Vector2(118,-7),Vector2(119,-7),Vector2(120,-7),Vector2(121,-7),Vector2(122,-7),Vector2(123,-7),Vector2(124,-7),Vector2(125,-7),Vector2(126,-7),Vector2(127,-7),Vector2(128,-7),Vector2(129,-7),Vector2(130,-7)},
        Checkpoint = {Vector2(0,0),Vector2(23,0),Vector2(31,-6),Vector2(-2,-4),Vector2(35,-13),Vector2(66,-16),Vector2(107,-17)},
        Pie = {Vector2(33.5,1.5)},
        Secret = {Vector2(99,-39)}},
        {Steel = {Vector2(-2,2),Vector2(-1,2),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(3,-16),Vector2(2,-16),Vector2(1,-16),Vector2(0,-16),Vector2(-1,-16),Vector2(-9,-26),Vector2(-10,-26),Vector2(-11,-26),Vector2(-25,-26),Vector2(-26,-26),Vector2(-27,-26),Vector2(-31,-26),Vector2(-32,-26),Vector2(-33,-26),Vector2(-60,7),Vector2(-59,7),Vector2(-58,7),Vector2(-65,11),Vector2(-64,11),Vector2(-63,11),Vector2(-62,11),Vector2(-61,11),Vector2(-60,11),Vector2(-85,11),Vector2(-86,11),Vector2(-87,11),Vector2(-79,-27),Vector2(-80,-27),Vector2(-89,-27),Vector2(-90,-27),Vector2(-91,-27),Vector2(-98.25,104.5)},
        Hard = {Vector2(2,1),Vector2(2,0),Vector2(2,-1),Vector2(2,-2),Vector2(2,-3),Vector2(-88,8),Vector2(-84,5),Vector2(-88,2),Vector2(-84,-1),Vector2(-96.25,104.5)},
        Brittle = {Vector2(-2,-5),Vector2(-2,-6),Vector2(-2,-7),Vector2(-2,-8),Vector2(-2,-9),Vector2(-68,13),Vector2(-95.25,104.5)},
        Rocky = {Vector2(7,-14),Vector2(7,-15),Vector2(7,-16),Vector2(7,-17),Vector2(7,-18),Vector2(-80,-19),Vector2(-76,-24),Vector2(-94.25,104.5)},
        Ice = {Vector2(0,-22),Vector2(-62,3),Vector2(-62,12.5),Vector2(-93.25,104.5)},
        Chunk = {Vector2(-35,-27),Vector2(-35,-28),Vector2(-61,6),Vector2(-61,5),Vector2(-61,4),Vector2(-62,6),Vector2(-62,5),Vector2(-62,4),Vector2(-92.25,104.5)},
        Organic = {Vector2(-37,-27),Vector2(-37,-28),Vector2(-82,10),Vector2(-82,9),Vector2(-91.25,104.5)},
        Normal = {Vector2(-8,-26),Vector2(-88,-8),Vector2(-78,-13),Vector2(-90.25,104.5)},
        Dirt = {Vector2(-13,-26),Vector2(-16,-26),Vector2(-20,-26),Vector2(-23,-26),Vector2(-61,3),Vector2(-89.25,104.5)},
        Fragile = {Vector2(-28,-28),Vector2(-29,-28),Vector2(-30,-28),Vector2(-65,10),Vector2(-65,9),Vector2(-88.25,104.5)},
        Kill = {Vector2(2,-4.5),Vector2(-2,-10.5),Vector2(7,-19),Vector2(0,-23),Vector2(1,-23),Vector2(1,-22),Vector2(-8,-28.5),Vector2(-12,-28.5),Vector2(-13,-28.5),Vector2(-14,-28.5),Vector2(-15,-28.5),Vector2(-16,-28.5),Vector2(-17,-28.5),Vector2(-18,-28.5),Vector2(-19,-28.5),Vector2(-20,-28.5),Vector2(-21,-28.5),Vector2(-22,-28.5),Vector2(-23,-28.5),Vector2(-24,-28.5),Vector2(-8,-25),Vector2(-12,-25),Vector2(-13,-25),Vector2(-14,-25),Vector2(-15,-25),Vector2(-16,-25),Vector2(-17,-25),Vector2(-18,-25),Vector2(-19,-25),Vector2(-20,-25),Vector2(-21,-25),Vector2(-22,-25),Vector2(-23,-25),Vector2(-24,-25),Vector2(-30,-26),Vector2(-29,-26),Vector2(-28,-26),Vector2(-30,-29),Vector2(-29,-29),Vector2(-28,-29),Vector2(-34,-26),Vector2(-35,-26),Vector2(-36,-26),Vector2(-37,-26),Vector2(-38,-26),Vector2(-34,-29),Vector2(-35,-29),Vector2(-36,-29),Vector2(-37,-29),Vector2(-38,-29),Vector2(-57,7),Vector2(-56,7),Vector2(-55,7),Vector2(-54,7),Vector2(-53,7),Vector2(-52,7),Vector2(-51,7),Vector2(-50,7),Vector2(-49,7),Vector2(-48,7),Vector2(-47,7),Vector2(-46,7),Vector2(-45,7),Vector2(-44,7),Vector2(-43,7),Vector2(-42,7),Vector2(-41,7),Vector2(-40,7),Vector2(-39,7),Vector2(-38,7),Vector2(-37,7),Vector2(-36,7),Vector2(-35,7),Vector2(-34,7),Vector2(-33,7),Vector2(-32,7),Vector2(-31,7),Vector2(-30,7),Vector2(-29,7),Vector2(-28,7),Vector2(-27,7),Vector2(-26,7),Vector2(-25,7),Vector2(-24,7),Vector2(-23,7),Vector2(-22,7),Vector2(-21,7),Vector2(-20,7),Vector2(-19,7),Vector2(-18,7),Vector2(-17,7),Vector2(-16,7),Vector2(-15,7),Vector2(-14,7),Vector2(-13,7),Vector2(-12,7),Vector2(-11,7),Vector2(-10,7),Vector2(-9,7),Vector2(-8,7),Vector2(-7,7),Vector2(-6,7),Vector2(-5,7),Vector2(-4,7),Vector2(-3,7),Vector2(-2,7),Vector2(-1,7),Vector2(0,7),Vector2(1,7),Vector2(2,7),Vector2(3,7),Vector2(4,7),Vector2(5,7),Vector2(6,7),Vector2(7,7),Vector2(8,7),Vector2(9,7),Vector2(10,7),Vector2(11,7),Vector2(12,7),Vector2(13,7),Vector2(14,7),Vector2(15,7),Vector2(16,7),Vector2(17,7),Vector2(18,7),Vector2(19,7),Vector2(20,7),Vector2(-61,7),Vector2(-63.5,-1),Vector2(-63.5,0),Vector2(-63.5,1),Vector2(-63.5,2),Vector2(-63.5,3),Vector2(-63.5,4),Vector2(-63.5,5),Vector2(-63.5,6),Vector2(-63.5,7),Vector2(-63.5,8),Vector2(-63.5,9),Vector2(-63.5,10),Vector2(-63,15),Vector2(-64,15),Vector2(-65,15),Vector2(-66,15),Vector2(-67,15),Vector2(-68,15),Vector2(-69,15),Vector2(-70,15),Vector2(-71,15),Vector2(-72,15),Vector2(-73,15),Vector2(-74,15),Vector2(-75,15),Vector2(-56.5,8),Vector2(-56.5,9),Vector2(-56.5,10),Vector2(-56.5,11),Vector2(-56.5,12),Vector2(-56.5,13),Vector2(-56.5,14),Vector2(-56.5,15),Vector2(-56.5,16),Vector2(-56.5,17),Vector2(-56.5,18),Vector2(-56.5,19),Vector2(-56.5,20),Vector2(-57.5,20),Vector2(-58.5,20),Vector2(-59.5,20),Vector2(-60.5,20),Vector2(-61.5,20),Vector2(-62.5,20),Vector2(-63.5,20),Vector2(-63.5,19),Vector2(-63.5,18),Vector2(-63.5,17),Vector2(-63.5,16),Vector2(-76,15),Vector2(-77,15),Vector2(-78,15),Vector2(-78,16),Vector2(-78,17),Vector2(-78,18),Vector2(-79,18),Vector2(-80,18),Vector2(-81,18),Vector2(-82,18),Vector2(-82,17),Vector2(-82,16),Vector2(-82,15),Vector2(-82,14),Vector2(-82,13),Vector2(-82,11.5),Vector2(-83,11.5),Vector2(-84,11.5),Vector2(-82,7.5),Vector2(-83,7.5),Vector2(-84,-2.5),Vector2(-84,0.5),Vector2(-84,3.5),Vector2(-84,6.5),Vector2(-88,6.5),Vector2(-88,9.5),Vector2(-88,0.5),Vector2(-88,3.5),Vector2(-88,-6.5),Vector2(-88,-9.5),Vector2(-89,-8),Vector2(-78,-11.5),Vector2(-78,-14.5),Vector2(-77,-13),Vector2(-80,-20.5),Vector2(-80,-17.5),Vector2(-81,-19),Vector2(-79,-24),Vector2(-73,-24),Vector2(-82,-27),Vector2(-83,-27),Vector2(-84,-27),Vector2(-85,-26.5),Vector2(-86,-26.5),Vector2(-87,-26.5),Vector2(-94.5,-31),Vector2(-94.5,-29),Vector2(-92,-27),Vector2(-94.5,-27),Vector2(-92,-25),Vector2(-94.5,-25),Vector2(-92,-23),Vector2(-94.5,-23),Vector2(-92,-21),Vector2(-94.5,-21),Vector2(-92,-19),Vector2(-94.5,-19),Vector2(-92,-17),Vector2(-94.5,-17),Vector2(-92,-15),Vector2(-94.5,-15),Vector2(-92,-13),Vector2(-94.5,-13),Vector2(-92,-11),Vector2(-94.5,-11),Vector2(-92,-9),Vector2(-94.5,-9),Vector2(-92,-7),Vector2(-94.5,-7),Vector2(-92,-5),Vector2(-94.5,-5),Vector2(-92,-3),Vector2(-94.5,-3),Vector2(-92,-1),Vector2(-94.5,-1),Vector2(-92,1),Vector2(-94.5,1),Vector2(-92,3),Vector2(-94.5,3),Vector2(-92,5),Vector2(-94.5,5),Vector2(-92,7),Vector2(-94.5,7),Vector2(-92,9),Vector2(-94.5,9),Vector2(-92,29),Vector2(-94.5,29),Vector2(-92,27),Vector2(-94.5,27),Vector2(-92,25),Vector2(-94.5,25),Vector2(-92,23),Vector2(-94.5,23),Vector2(-92,21),Vector2(-94.5,21),Vector2(-92,19),Vector2(-94.5,19),Vector2(-92,17),Vector2(-94.5,17),Vector2(-92,15),Vector2(-94.5,15),Vector2(-92,13),Vector2(-94.5,13),Vector2(-92,11),Vector2(-94.5,11),Vector2(-92,31),Vector2(-94.5,31),Vector2(-92,33),Vector2(-94.5,33),Vector2(-92,35),Vector2(-94.5,35),Vector2(-92,37),Vector2(-94.5,37),Vector2(-92,39),Vector2(-94.5,39),Vector2(-92,41),Vector2(-94.5,41),Vector2(-92,43),Vector2(-94.5,43),Vector2(-92,45),Vector2(-94.5,45),Vector2(-92,47),Vector2(-94.5,47),Vector2(-92,49),Vector2(-94.5,49),Vector2(-92,51),Vector2(-94.5,51),Vector2(-92,53),Vector2(-94.5,53),Vector2(-92,55),Vector2(-94.5,55),Vector2(-92,57),Vector2(-94.5,57),Vector2(-92,59),Vector2(-94.5,59),Vector2(-92,61),Vector2(-94.5,61),Vector2(-92,63),Vector2(-94.5,63),Vector2(-92,65),Vector2(-94.5,65),Vector2(-92,67),Vector2(-94.5,67),Vector2(-92,69),Vector2(-94.5,69),Vector2(-92,71),Vector2(-94.5,71),Vector2(-92,73),Vector2(-94.5,73),Vector2(-92,75),Vector2(-94.5,75),Vector2(-92,77),Vector2(-94.5,77),Vector2(-92,79),Vector2(-94.5,79),Vector2(-92,81),Vector2(-94.5,81),Vector2(-92,83),Vector2(-94.5,83),Vector2(-92,85),Vector2(-94.5,85),Vector2(-92,87),Vector2(-94.5,87),Vector2(-92,89),Vector2(-94.5,89),Vector2(-92,91),Vector2(-94.5,91),Vector2(-92,93),Vector2(-94.5,93),Vector2(-92,95),Vector2(-94.5,95),Vector2(-92,97),Vector2(-94.5,97),Vector2(-92,99),Vector2(-94.5,99),Vector2(-97.25,104.5)},
        Checkpoint = {Vector2(0,0),Vector2(2,-18),Vector2(-10,-28),Vector2(-26,-28),Vector2(-32,-28),Vector2(-59,5),Vector2(-62,9),Vector2(-65,7),Vector2(-86,9),Vector2(-79.5,-13),Vector2(-79,-29),Vector2(-90,-29)},
        Pie = {Vector2(-41,-27.5)},
        Secret = {Vector2(-93.25,100)}},
        {Steel = {Vector2(-1,2),Vector2(0,2),Vector2(1,2)},
        Checkpoint = {Vector2(0,0)}}
    },
    background_layout = {
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,-1),Vector2(1,-1),Vector2(-1,-1),Vector2(0,1),Vector2(1,1),Vector2(-1,1)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(2,0),Vector2(3,0),Vector2(2,1),Vector2(3,1),Vector2(1,1),Vector2(1,-1),Vector2(2,-1),Vector2(0,1),Vector2(0,-1)},
        {Vector2(0,0),Vector2(1,0),Vector2(-1,0),Vector2(-2,0),Vector2(-1,-1),Vector2(-2,-1),Vector2(-1,1),Vector2(-2,1),Vector2(0,1),Vector2(1,1),Vector2(0,-1),Vector2(1,-1),Vector2(0,-2),Vector2(-1,-2)},
        {Vector2(0,0),Vector2(0,1),Vector2(0,-1),Vector2(1,0),Vector2(1,1),Vector2(1,-1),Vector2(-1,0),Vector2(-1,1),Vector2(-1,-1),Vector2(-1,-2),Vector2(-1,2)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(-1,1),Vector2(1,1),Vector2(0,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(2,1),Vector2(2,0),Vector2(2,-1)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(-1,1),Vector2(1,1),Vector2(0,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(-2,0),Vector2(-2,-1),Vector2(-2,1),Vector2(0,-2),Vector2(-1,-2),Vector2(1,-2),Vector2(2,-2),Vector2(2,-1),Vector2(2,0),Vector2(2,1),Vector2(0,-3),Vector2(1,-3)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(-1,1),Vector2(1,1),Vector2(0,-1),Vector2(-1,-1),Vector2(1,-1)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(-1,1),Vector2(1,1),Vector2(0,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(0,-2),Vector2(-1,-2),Vector2(1,-2)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(-1,1),Vector2(1,1),Vector2(0,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(-2,-1),Vector2(-2,0)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(-1,1),Vector2(1,1),Vector2(0,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(0,2),Vector2(1,2),Vector2(2,2),Vector2(2,1),Vector2(2,0)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(-1,1),Vector2(1,1),Vector2(0,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(2,0),Vector2(2,-1),Vector2(2,1),Vector2(3,0),Vector2(3,-1),Vector2(3,1),Vector2(4,0),Vector2(4,-1),Vector2(4,1),Vector2(4,-2),Vector2(3,-2),Vector2(2,-2),Vector2(4,-3),Vector2(3,-3),Vector2(2,-3),Vector2(0,-2),Vector2(1,-2)},
        {Vector2(0,0),Vector2(-1,0),Vector2(1,0),Vector2(0,1),Vector2(-1,1),Vector2(1,1),Vector2(0,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(0,-2),Vector2(-1,-2),Vector2(1,-2),Vector2(-2,0),Vector2(-2,-1),Vector2(-2,1),Vector2(-2,-2),Vector2(-3,-1),Vector2(-3,-2),Vector2(-3,0),Vector2(-3,1),Vector2(-3,2),Vector2(-2,2),Vector2(-3,3),Vector2(-3,4),Vector2(-3,5),Vector2(-3,6),Vector2(-3,7),Vector2(-2,3),Vector2(-2,4),Vector2(-2,5),Vector2(-2,6),Vector2(-2,7)}
    },

    -- Checkpoint select display and level layouts.
    checkpoint_layouts = {
        {Vector2(0,0)},
        {Vector2(-1,0),Vector2(1,0)},
        {Vector2(-2,0),Vector2(0,0),Vector2(2,0)},
        {Vector2(-3,0),Vector2(-1,0),Vector2(1,0),Vector2(3,0)},
        {Vector2(-2,-1),Vector2(-0,-1),Vector2(2,-1),Vector2(-2,1), Vector2(0,1)},
        {Vector2(-2,-1),Vector2(-0,-1),Vector2(2,-1),Vector2(-2,1), Vector2(0,1),Vector2(2,1)},
        {Vector2(-3,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(3,-1), Vector2(-3,1), Vector2(-1,1), Vector2(1,1)},
        {Vector2(-3,-1),Vector2(-1,-1),Vector2(1,-1),Vector2(3,-1), Vector2(-3,1), Vector2(-1,1), Vector2(1,1), Vector2(3,1)},
        {Vector2(-3,-2),Vector2(-1,-2),Vector2(1,-2),Vector2(3,-2),Vector2(-3,0),Vector2(-1,0),Vector2(1,0),Vector2(3,0),Vector2(-3,2)},
        {Vector2(-3,-2),Vector2(-1,-2),Vector2(1,-2),Vector2(3,-2),Vector2(-3,0),Vector2(-1,0),Vector2(1,0),Vector2(3,0),Vector2(-3,2),Vector2(-1,2)},
        {Vector2(-3,-2),Vector2(-1,-2),Vector2(1,-2),Vector2(3,-2),Vector2(-3,0),Vector2(-1,0),Vector2(1,0),Vector2(3,0),Vector2(-3,2),Vector2(-1,2),Vector2(1,2)},
        {Vector2(-3,-2),Vector2(-1,-2),Vector2(1,-2),Vector2(3,-2),Vector2(-3,0),Vector2(-1,0),Vector2(1,0),Vector2(3,0),Vector2(-3,2),Vector2(-1,2),Vector2(1,2),Vector2(3,2)}
    },
    level_layout = {
        {location = 1, visible = 1, total = 1},
        {location = 1, visible = 3, total = 6},
        {location = 1, visible = 3, total = 5},
        {location = 1, visible = 3, total = 5},
        {location = 1, visible = 2, total = 5},
        {location = 1, visible = 1, total = 4},
        {location = 1, visible = 1, total = 2},
        {location = 1, visible = 2, total = 5},
        {location = 1, visible = 2, total = 5},
        {location = 1, visible = 2, total = 5},
        {location = 1, visible = 3, total = 7},
        {location = 1, visible = 5, total = 12},
    },

    -- Hint text.
    hints = {
        {{"Use a and d to move left and right, space to jump, and", "enter to reload the level from the last checkpoint.", "The longer you hold space, the higher you'll jump!"}},
        {{"Hold s to crouch. You'll be 1/4 block shorter!"},{"With precisely timed jumps, crouching allows", "you to jump into and out of one block gaps."},{"Crouching also helps you avoid kill blocks!"},{"This is pretty much a harder version of the previous jump."},{"You'll need some precisely timed jumps. Make sure to", "release a/d before you land to not hit the kill blocks!"},{"Use just enough sideways momenutm to center", "yourself on the pit. Then you'll fall straight down!"}},
        {{"Blocks with a diamond symbol allow you to wall climb.", "Hold a/d towards the wall, and w/s to move up and down."},{"Wall climbing makes you 1/4 block shorter sideways!"},{"You can use momentum out of a wall climb (holding", "space and/or WASD) to launch you further! "},{"Using upwards momentum from pressing w, launch yourself up to", "the left; crouch midway to avoid the kill block. Be sure to let go as", "you hit the wall so you don't go down into another kill block!"},{"For this first jump, just climb to the top of the wall and", "hold d + s. On the second wall, use space + w to get a full", "launch. Crouch and time it just right to reach the pie piece!"}},
        {{"Blocks with a red symbol are only temporarily", "usable. They will respawn after a brief moment."},{"Time it so that the right wall reappears just as the left", "blocks disappear, allowing you to jump through the broken", "blocks. You might have to jump from lower than you think!"},{"Holding space + w will always get you the", "most upwards momentum out of a wall climb."},{"Jump at the last moment to reach the next orange block."},{"Just like checkpoint 2, time your jumps to make the", "topmost block disappear right when the right blocks reappear.", "You'll have to time your jump and crouch to get through!"}},
        {{"Blocks with a circle can be grappled. Left click with the", "mouse to shoot a grapple to where your cursor is. Press", "space or use another grapple to disconnect yourself."},{"Even if you move far away from where you", "initially shot your grapple, it will still pull you there.", "You can also grapple anything with a curved edge!"},{"If you are grappled to the top of a block, holding space gives", "you a super jump. You may have to shoot many grapples to", "get to the next checkpoint! Try to reach the highest pink block."},{"You can use momentum from the grapple pull to get", "yourself to the top of the block. Hold space before", "reaching the block to avoid hitting it and losing speed."},{"Use a super jump to grapple the pie piece from below. Then just", "maneuver your way around the kill block with many grapple shots!"}},
        {{"If you're still holding on to a red circle block when it dis-", "appears, it will give you a little momentum in the direction you're", "holding. This also happens when you try to grapple it twice."},{"Use a super jump to get a good grapple angle. Once", "you've made it, hold space + s + d and re-grapple at just", "the right time to give you momentum to avoid the kill blocks."},{"You can buffer a jump input by pressing another WASD key after", "jumping. This allows you to maximize upwards momentum from a", "disappearing block. Crouching also gives you a tiny boost."},{"Use the previous hint to make a much harder jump!"}},
        {{"To avoid the bottom steel block, move as far to the right", "as possible. You may have to re-grapple a couple times!"},{"To get to the third block, it helps to get some upwards momentum", "by falling and re-grappling yourself to the second block."}},
        {{"Get rid of the middle blocks so that you can grapple straight through.", "Avoid wall climbing any blocks you don't want to disappear!"},{"Get as big a jump as you can holding space +", "w off the right wall. Hold near the top of the", "two blocks to ensure you hit the pie piece!"},{"Chain a super jump and a bounce to go back left", "to reach the block. React quick to grapple to", "the upper block when the bottom one breaks!"},{"Use a buffered jump to get up to the next platform."},{"Time an upwards wall climb as soon as the", "block decays to get some upwards momentum."}},
        {{"This is the same strategy as the last", "level, but grapple and climbing are swapped."},{"Use momentum from the broken blocks to beat this part. It", "will be easier to re-grapple than wait for it to break."},{"You'll have to act fast to climb onto the", "block and bounce to the next checkpoint."},{"While crouching, grapple to the first block, then re-grapple to break", "the block and quickly grapple to the next block behind it. Make sure", "to have a slight angle up to avoid falling into the kill blocks."},{"Super jump to reach the upper block, and at the right moment", "jump off and bounce off the lower ground. The upper block will", "respawn, and you can climb it and super jump to the pie piece."}},
        {{"Dirt blocks will start to break even if you", "just bump into them or walk on them. This makes", "the same setup as level 8 and 9 more tricky."},{"After the dirt blocks have broken, jump down", "and grapple the blocks as they respawn to give", "you upwards momentum to reach the pie piece."},{"Buffering a jump, fall through the first block and grapple", "the bottom of the second. Use the momentum of re-grappling", "to get above the third block and use it for a super jump."},{"This is a harder version of the checkpoint 2 setup. Crouching", "and a quick reaction will help you get through the gap."},{"You'll have to chain super jumps on each of the blocks. Be careful", "not to hit them before grappling them! It may help to aim the", "grapple slightly towards the block instead of just straight down."}},
        {{"Fragile blocks also get broken by being touched, but you can't", "climb or grapple them. In fact, they instantly break if grappled."},{"Orange blocks can also be insantly broken with the grapple."},{"Grappling through orange blocks allows you to go", "down through them, which isn't normally possible!"},{"Going into blocks as they respawn clips you through them. This is", "easy when destroying fragile blocks with the grapple. Use the column", "at checkpoint 3 to launch yourself up. Holding space + s helps!"},{"This looks just like level 1! Use well placed", "jumps and bounces to get to the next checkpoint."},{"This looks just like level 2! Jumping through", "the 1 block gaps requires very precise timing."},{"This looks just like level 3! You'll need to launch yourself", "up fragile pillars twice to get to the end. Make sure to", "stay right in the middle to avoid clipping to the side."}},
        {{"Climb up the two walls and grapple to the final one."},{"Hold space just before  you re-grapple the blue block to maximize", "your speed. You may have to re-grapple the green block to avoid the", "kill block! Climb and immediately crouch to avoid another kill block."},{"Lightly tap the space bar to get a short hop. Do three of these", "in a row to reach the end. It helps to pause on each block."},{"When the fragile blocks are broken, jump right before the", "kill block while crouching to reach the next checkpoint."},{"First, get rid of the yellow blocks, then crouch jump to the", "white ones. When the yellow blocks respawn, hold onto them as", "you quickly break the white blocks to get to the pie piece."},{"Break the outer layer of yellow blocks. Then, quickly trigger the", "inner layer. Use the dirt block to quickly reach the top, and use", "the ice block to launch yourself through the broken inner layer."},{"Buffer a jump and grapple the bottom left of the blue block. Precisely", "time your jump to reach the orange block, and bounce off it to reach", "the fragile block. Make sure to destroy them with the grapple!"},{"Bounce off the blocks to reach the white blocks. You may have", "to re-grapple them to get the angle right. Use momentum to get", "through, or grapple a newly-respawned block just as you go past."},{"Hold space + w to get vertical momentum on the last purple block", "to reach the first green block, then take a leap of faith to reach", "the second. You will have to re-grapple to reach them."},{"The same space + w setup is needed here along with precise cursor", "placement. Then use momentum from the grapple to get to the top", "of the second block, followed by a super jump to the checkpoint."},{"Precisely timed, crouch jumps can be used to jump on kill blocks."},{"Enjoy the fall!"}}
    },
    secret_hints = {
        {1, {"Pressing space precisely as you land allows", "you to rebound and bounce higher. This bounce", "is easier to achieve when you are crouching."}},
        {3, {"Do a full jump off the right edge of the level."}},
        {3, {"Crouch through the one block gap and do a", "full jump off the top of the purple blocks."}},
        {2, {"Get to the top of the lower left orange wall,", "then bounce on it to get past the kill blocks."}},
        {2, {"Chain bounces on the top pink blocks to gain", "height and go all the way to the right."}},
        {1, {"Use re-grapple momentum to get on top of the last 3", "ice blocks. Super jump on the last block to grapple a", "block above, and use momentum to hit the checkpoint."}},
        {1, {"Use a super jump to get on the oppsite side of the second", "green block, and do a full jump off it to the left."}},
        {2, {"Get on the other side of the yellow wall, and full", "launch up to the right to grapple the further blocks.", "You may have to re-grapple to get a good angle."}},
        {2, {"Buffer a jump and slowly wall climb down the single white", "block to the left. Grapple the bottom of it, then precisely", "time your re-grapple momentum to go far to the left."}},
        {2, {"Avoid the pie piece, and precisely manage your", "side velocity to pass between the kill blocks."}},
        {3, {"Jump onto the roof of the previous", "segment, and go all the way to the left."}},
        {5, {"Get to the other side of the pie piece, and use", "grapple momentum from it to launch far to the left."}}
    },

    -- Template vectors.
    down = Vector2(0,1),
    left = Vector2(-1,0),
    right = Vector2(1,0),
    blank_vector = Vector3(0,0,0),

    -- On Start function. Tells the engine to keep this actor across scenes.
    OnStart = function(self)
        Scene.DontDestroy(self.actor)
    end, -- ON START

    -- On Update function. Keeps the normal computer cursor hidden.
    OnUpdate = function(self)
        if Application.IsCursorVisible() then
            Application.HideCursor()
        end -- CURSOR VISIBILE
    end, -- ON UPDATE

    -- Update Music function:
    -- Load and play the track if it's not playing already.
    -- Set all music parameters based on level and player type.
    UpdateMusic = function (self, level)

        if not Audio.IsEventPlaying(self.square_time) then
            Audio.LoadBank("Master Bank.strings")
            Audio.LoadBank("Master Bank")
            Audio.LoadBank("music")
            Audio.PlayEvent(self.square_time, self.blank_vector, self.blank_vector, true)
        end -- MUSIC NOT INITIALIZED

        for parameter, values in pairs(self.parameters[self.player_type]) do
            Audio.SetEventParameter(self.square_time, parameter, values[level+1])
        end -- PARAMETER LOOP

    end, -- UPDATE MUSIC

    -- Show the level buttons:
    -- Get the ButtonManager, SpriteRenderer, and ButtonLevel components.
    -- Turn on the ButtonManager and base sprite.
    -- Toggle the button based on if the player has reached the level.
    -- Add the secret overlay if the secret is found.
    ShowLevelButtons = function(self, levels, player_mode)
        for index, value in ipairs(levels) do

            local bm = value:GetComponent("ButtonManager")
            local srs = value:GetComponents("SpriteRenderer")
            local bl = value:GetComponent("ButtonLevel")

            bm.enabled = true
            srs[2].enabled = true

            if bl.level > self.level_reached[player_mode] then
                srs[3].enabled = true
                srs[5].enabled = true
                bm.clickable = false
                value:GetComponent("TextRenderer").enabled = false
            else
                bm.clickable = true
                value:GetComponent("TextRenderer").enabled = true
            end -- LEVEL VISIBILITY

            if self.secrets_found[bl.level][player_mode] then
                srs[4].enabled = true
            end -- SECRET FOUND

        end -- LEVEL BUTTON LOOP

    end, -- SHOW LEVEL BUTTONS

    -- Hide Level Buttons function:
    -- Disable ButtonManager, TextRenderer, and all SpriteRenderers.
    HideLevelButtons = function(self, levels)
        for index, value in ipairs(levels) do
            value:GetComponent("ButtonManager").enabled = false
            value:GetComponent("TextRenderer").enabled = false
            local srs = value:GetComponents("SpriteRenderer")
            srs[1].enabled = false
            srs[2].enabled = false
            srs[3].enabled = false
            srs[4].enabled = false
            srs[5].enabled = false
        end -- BUTTON LOOP
    end, -- HIDE LEVEL BUTTONS

    -- Load Checkpoint Buttons:
    -- Get the total number of buttons to load based on player progress.
    -- Create each checkpoint with its respective level and position.
    -- Toggle the checkpoint based on if the player has reached it.
    LoadCheckpointButtons = function (self, level, player_type)

        local count = self.level_layout[level]["visible"]
        if self.player_progress[level][player_type] > self.level_layout[level]["visible"] then
            count = self.level_layout[level]["total"]
        end -- CAN SEE SECRET CHECKPOINTS

        for index, value in ipairs(self.checkpoint_layouts[count]) do

            local cur_cp = Actor.Instantiate("CheckpointButton")
            cur_cp:GetComponent("ButtonPlay").level = level
            cur_cp:GetComponent("Rigidbody"):SetPosition(value)
            
            if index > self.player_progress[level][player_type] then
                cur_cp:GetComponent("TextRenderer").enabled = false
                cur_cp:GetComponents("SpriteRenderer")[2].sprite = "checkpoint"
            else
                cur_cp:GetComponent("TextRenderer").text = tostring(index)
                cur_cp:GetComponents("SpriteRenderer")[2].sprite = "respawn"
            end -- CHECKPOINT AVAILABILITY

        end -- CHECKPOINT LOOP
        
    end, -- LOAD CHECKPOINT BUTTONS

    -- Remove Checkpoint Buttons:
    -- Find all existing checkpoint buttons and delete them.
    RemoveCheckpointButtons = function ()
        local buttons = Actor.FindAll("Checkpoint Button")
        for index, value in ipairs(buttons) do
            Actor.Destroy(value)
        end -- BUTTON LOOP
    end, -- REMOVE CHECKPOINT BUTTONS

    -- Load the File Menu:
    -- Instantiate FileButton and FileDisplay actors for all three files.
    -- Set the actors' positions, modes, and file number.
    LoadFileMenu = function (self, mode)
        for i = 1, 3, 1 do

            local fb = Actor.Instantiate("FileButton")
            local fb_bf = fb:GetComponent("ButtonFile")
            local fd = Actor.Instantiate("FileDisplay")

            fb:GetComponent("Rigidbody"):SetPosition(Vector2(-6.35,i*2-4))
            fd:GetComponent("Rigidbody"):SetPosition(Vector2(1.95,i*2-4))
            fb_bf.file = i
            fd:GetComponent("FileDisplay").file = i
            fb_bf.mode = mode

        end -- FILE LOOP
    end, -- LOAD FILE MENU

    -- Remove the File Menu:
    -- Find all FileButton and FileDisplay actors and delete them.
    RemoveFileMenu = function (self)
        local fbs = Actor.FindAll("FileButton")
        local fds = Actor.FindAll("File Display")
        for key, value in pairs(fbs) do
            Actor.Destroy(value)
        end -- FILE BUTTON LOOP
        for key, value in pairs(fds) do
            Actor.Destroy(value)
        end -- FILE DISPLAY LOOP
    end, -- REMOVE FILE MENU

    -- Load Pause Menu function:
    -- Instantiate all the pause menu actors.
    -- Unrestrict the cursor and disable the player.
    LoadPauseMenu = function (self, player)

        Actor.Instantiate("Backdrop")
        Actor.Instantiate("Pause")
        Actor.Instantiate("ButtonResume")
        Actor.Instantiate("ButtonHint")
        Actor.Instantiate("ButtonMenu")
        Actor.Instantiate("ButtonBack")

        Actor.Find("Cursor"):GetComponent("CursorManager").restricted = false
        player.enabled = false

    end -- LOAD PAUSE MENU

} -- STATIC DATA