DROP TABLE IF EXISTS `EVENTS`
;
CREATE TABLE EVENTS (
GAME_ID varchar(12)
,AWAY_TEAM_ID varchar(3)
,INN_CT INTEGER
,BAT_HOME_ID INTEGER
,OUTS_CT INTEGER
,BALLS_CT INTEGER
,STRIKES_CT INTEGER
,PITCH_SEQ_TX varchar(40)
,AWAY_SCORE_CT INTEGER
,HOME_SCORE_CT INTEGER
,BAT_ID varchar(8)
,BAT_HAND_CD varchar(1)
,RESP_BAT_ID varchar(8)
,RESP_BAT_HAND_CD varchar(1)
,PIT_ID varchar(8)
,PIT_HAND_CD varchar(1)
,RES_PIT_ID varchar(8)
,RES_PIT_HAND_CD varchar(1)
,POS2_FLD_ID varchar(8)
,POS3_FLD_ID varchar(8)
,POS4_FLD_ID varchar(8)
,POS5_FLD_ID varchar(8)
,POS6_FLD_ID varchar(8)
,POS7_FLD_ID varchar(8)
,POS8_FLD_ID varchar(8)
,POS9_FLD_ID varchar(8)
,BASE1_RUN_ID varchar(8)
,BASE2_RUN_ID varchar(8)
,BASE3_RUN_ID varchar(8)
,EVENT_TX varchar(100)
,LEADOFF_FL varchar(1)
,PH_FL varchar(1)
,BAT_FLD_CD INTEGER
,BAT_LINEUP_ID INTEGER
,EVENT_CD INTEGER
,BAT_EVENT_FL varchar(1)
,AB_FL varchar(1)
,H_CD INTEGER
,SH_FL varchar(1)
,SF_FL varchar(1)
,EVENT_OUTS_CT INTEGER
,DP_FL varchar(1)
,TP_FL varchar(1)
,RBI_CT INTEGER
,WP_FL varchar(1)
,PB_FL varchar(1)
,FLD_CD INTEGER
,BATTEDBALL_CD varchar(1)
,BUNT_FL varchar(1)
,FOUL_FL varchar(1)
,BATTEDBALL_LOC_TX varchar(5)
,ERR_CT INTEGER
,ERR1_FLD_CD INTEGER
,ERR1_CD varchar(1)
,ERR2_FLD_CD INTEGER
,ERR2_CD varchar(1)
,ERR3_FLD_CD INTEGER
,ERR3_CD varchar(1)
,BAT_DEST_ID INTEGER
,RUN1_DEST_ID INTEGER
,RUN2_DEST_ID INTEGER
,RUN3_DEST_ID INTEGER
,BAT_PLAY_TX varchar(8)
,RUN1_PLAY_TX varchar(15)
,RUN2_PLAY_TX varchar(15)
,RUN3_PLAY_TX varchar(15)
,RUN1_SB_FL varchar(1)
,RUN2_SB_FL varchar(1)
,RUN3_SB_FL varchar(1)
,RUN1_CS_FL varchar(1)
,RUN2_CS_FL varchar(1)
,RUN3_CS_FL varchar(1)
,RUN1_PK_FL varchar(1)
,RUN2_PK_FL varchar(1)
,RUN3_PK_FL varchar(1)
,RUN1_RESP_PIT_ID varchar(8)
,RUN2_RESP_PIT_ID varchar(8)
,RUN3_RESP_PIT_ID varchar(8)
,GAME_NEW_FL varchar(1)
,GAME_END_FL varchar(1)
,PR_RUN1_FL varchar(1)
,PR_RUN2_FL varchar(1)
,PR_RUN3_FL varchar(1)
,REMOVED_FOR_PR_RUN1_ID varchar(8)
,REMOVED_FOR_PR_RUN2_ID varchar(8)
,REMOVED_FOR_PR_RUN3_ID varchar(8)
,REMOVED_FOR_PH_BAT_ID varchar(8)
,REMOVED_FOR_PH_BAT_FLD_CD INTEGER
,PO1_FLD_CD INTEGER
,PO2_FLD_CD INTEGER
,PO3_FLD_CD INTEGER
,ASS1_FLD_CD INTEGER
,ASS2_FLD_CD INTEGER
,ASS3_FLD_CD INTEGER
,ASS4_FLD_CD INTEGER
,ASS5_FLD_CD INTEGER
,EVENT_ID INTEGER
/* following are extended fields */
,HOME_TEAM_ID varchar(3)
,BAT_TEAM_ID varchar(3)
,FLD_TEAM_ID varchar(3)
,BAT_LAST_ID INTEGER
,INN_NEW_FL varchar(1)
,INN_END_FL varchar(1)
,START_BAT_SCORE_CT INTEGER
,START_FLD_SCORE_CT INTEGER
,INN_RUNS_CT INTEGER
,GAME_PA_CT INTEGER
,INN_PA_CT INTEGER
,PA_NEW_FL varchar(1)
,PA_TRUNC_FL varchar(1)
,START_BASES_CD INTEGER
,END_BASES_CD INTEGER
,BAT_START_FL varchar(1)
,RESP_BAT_START_FL varchar(1)
,PIT_START_FL varchar(1)
,RESP_PIT_START_FL varchar(1)
,RUN1_FLD_CD INTEGER
,RUN1_LINEUP_CD INTEGER
,RUN1_ORIGIN_EVENT_ID INTEGER
,RUN2_FLD_CD INTEGER
,RUN2_LINEUP_CD INTEGER
,RUN2_ORIGIN_EVENT_ID INTEGER
,RUN3_FLD_CD INTEGER
,RUN3_LINEUP_CD INTEGER
,RUN3_ORIGIN_EVENT_ID INTEGER
,RUN1_RESP_CAT_ID varchar(8)
,RUN2_RESP_CAT_ID varchar(8)
,RUN3_RESP_CAT_ID varchar(8)
,PA_BALL_CT INTEGER
,PA_CALLED_BALL_CT INTEGER default 0
,PA_INTENT_BALL_CT INTEGER
,PA_PITCHOUT_BALL_CT INTEGER
,PA_HITBATTER_BALL_CT INTEGER
,PA_OTHER_BALL_CT INTEGER
,PA_STRIKE_CT INTEGER
,PA_CALLED_STRIKE_CT INTEGER
,PA_SWINGMISS_STRIKE_CT INTEGER
,PA_FOUL_STRIKE_CT INTEGER
,PA_INPLAY_STRIKE_CT INTEGER
,PA_OTHER_STRIKE_CT INTEGER
,EVENT_RUNS_CT INTEGER
,FLD_ID varchar(8)
,BASE2_FORCE_FL varchar(1)
,BASE3_FORCE_FL varchar(1)
,BASE4_FORCE_FL varchar(1)
,BAT_SAFE_ERR_FL varchar(1)
,BAT_FATE_ID INTEGER
,RUN1_FATE_ID INTEGER
,RUN2_FATE_ID INTEGER
,RUN3_FATE_ID INTEGER
,FATE_RUNS_CT INTEGER
,ASS6_FLD_CD INTEGER
,ASS7_FLD_CD INTEGER
,ASS8_FLD_CD INTEGER
,ASS9_FLD_CD INTEGER
,ASS10_FLD_CD INTEGER
,UNKNOWN_OUT_EXC_FL varchar(1)
,UNCERTAIN_PLAY_EXC_FL varchar(1)
,PRIMARY KEY (GAME_ID, EVENT_ID)
)
;
commit;

DROP TABLE if exists GAMES
;
CREATE TABLE GAMES (
GAME_ID varchar(12) PRIMARY KEY
,GAME_DT INTEGER
,GAME_CT INTEGER
,GAME_DY varchar(9)
,START_GAME_TM INTEGER
,DH_FL varchar(1)
,DAYNIGHT_PARK_CD varchar(1)
,AWAY_TEAM_ID varchar(3)
,HOME_TEAM_ID varchar(3)
,PARK_ID varchar(5)
,AWAY_START_PIT_ID varchar(8)
,HOME_START_PIT_ID varchar(8)
,BASE4_UMP_ID varchar(8)
,BASE1_UMP_ID varchar(8)
,BASE2_UMP_ID varchar(8)
,BASE3_UMP_ID varchar(8)
,LF_UMP_ID varchar(8)
,RF_UMP_ID varchar(8)
,ATTEND_PARK_CT INTEGER
,SCORER_RECORD_ID varchar(50)
,TRANSLATOR_RECORD_ID varchar(50)
,INPUTTER_RECORD_ID varchar(50)
,INPUT_RECORD_TS varchar(18)
,EDIT_RECORD_TS varchar(18)
,METHOD_RECORD_CD varchar(18)
,PITCHES_RECORD_CD varchar(1)
,TEMP_PARK_CT INTEGER
,WIND_DIRECTION_PARK_CD INTEGER
,WIND_SPEED_PARK_CT INTEGER
,FIELD_PARK_CD INTEGER
,PRECIP_PARK_CD INTEGER
,SKY_PARK_CD INTEGER
,MINUTES_GAME_CT INTEGER
,INN_CT INTEGER
,AWAY_SCORE_CT INTEGER
,HOME_SCORE_CT INTEGER
,AWAY_HITS_CT INTEGER
,HOME_HITS_CT INTEGER
,AWAY_ERR_CT INTEGER
,HOME_ERR_CT INTEGER
,AWAY_LOB_CT INTEGER
,HOME_LOB_CT INTEGER
,WIN_PIT_ID varchar(8)
,LOSE_PIT_ID varchar(8)
,SAVE_PIT_ID varchar(8)
,GWRBI_BAT_ID varchar(8)
,AWAY_LINEUP1_BAT_ID varchar(8)
,AWAY_LINEUP1_FLD_CD INTEGER
,AWAY_LINEUP2_BAT_ID varchar(8)
,AWAY_LINEUP2_FLD_CD INTEGER
,AWAY_LINEUP3_BAT_ID varchar(8)
,AWAY_LINEUP3_FLD_CD INTEGER
,AWAY_LINEUP4_BAT_ID varchar(8)
,AWAY_LINEUP4_FLD_CD INTEGER
,AWAY_LINEUP5_BAT_ID varchar(8)
,AWAY_LINEUP5_FLD_CD INTEGER
,AWAY_LINEUP6_BAT_ID varchar(8)
,AWAY_LINEUP6_FLD_CD INTEGER
,AWAY_LINEUP7_BAT_ID varchar(8)
,AWAY_LINEUP7_FLD_CD INTEGER
,AWAY_LINEUP8_BAT_ID varchar(8)
,AWAY_LINEUP8_FLD_CD INTEGER
,AWAY_LINEUP9_BAT_ID varchar(8)
,AWAY_LINEUP9_FLD_CD INTEGER
,HOME_LINEUP1_BAT_ID varchar(8)
,HOME_LINEUP1_FLD_CD INTEGER
,HOME_LINEUP2_BAT_ID varchar(8)
,HOME_LINEUP2_FLD_CD INTEGER
,HOME_LINEUP3_BAT_ID varchar(8)
,HOME_LINEUP3_FLD_CD INTEGER
,HOME_LINEUP4_BAT_ID varchar(8)
,HOME_LINEUP4_FLD_CD INTEGER
,HOME_LINEUP5_BAT_ID varchar(8)
,HOME_LINEUP5_FLD_CD INTEGER
,HOME_LINEUP6_BAT_ID varchar(8)
,HOME_LINEUP6_FLD_CD INTEGER
,HOME_LINEUP7_BAT_ID varchar(8)
,HOME_LINEUP7_FLD_CD INTEGER
,HOME_LINEUP8_BAT_ID varchar(8)
,HOME_LINEUP8_FLD_CD INTEGER
,HOME_LINEUP9_BAT_ID varchar(8)
,HOME_LINEUP9_FLD_CD INTEGER
,AWAY_FINISH_PIT_ID varchar(8)
,HOME_FINISH_PIT_ID varchar(8)
)
;
commit;

DROP TABLE if exists ROSTERS
;
CREATE TABLE ROSTERS (
 YEAR_ID INTEGER
,TEAM_ID varchar(3)
,PLAYER_ID varchar(8)
,LAST_NAME_TX varchar(25)
,FIRST_NAME_TX varchar(25)
,BAT_HAND_CD varchar(1)
,PIT_HAND_CD varchar(1)
,TEAM_TX varchar(3)
,POS_TX varchar(5)
)
;
commit;

DROP TABLE if exists TEAMS
;
CREATE TABLE TEAMS (
 YEAR_ID INTEGER
,TEAM_ID varchar(3)
,LG_ID varchar(1)
,LOC_TEAM_TX varchar(30)
,NAME_TEAM_TX varchar(30)
)
;
commit;

DROP TABLE if exists PARKCODES
;
CREATE TABLE `PARKCODES` (
  `PARKID` varchar(6) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `AKA` varchar(255) DEFAULT NULL,
  `CITY` varchar(100) DEFAULT NULL,
  `STATE` varchar(3) DEFAULT NULL,
  `START` varchar(11) DEFAULT NULL,
  `END` varchar(11) DEFAULT NULL,
  `LEAGUE` varchar(3) DEFAULT NULL,
  `NOTES` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`PARKID`)
)
;
commit;

DROP TABLE if exists LKUP_CD_BASES;
DROP TABLE if exists LKUP_CD_BATTEDBALL;
DROP TABLE if exists LKUP_CD_EVENT;
DROP TABLE if exists LKUP_CD_FLD;
DROP TABLE if exists LKUP_CD_H;
DROP TABLE if exists LKUP_CD_HAND;
DROP TABLE if exists LKUP_CD_PARK_DAYNIGHT;
DROP TABLE if exists LKUP_CD_PARK_FIELD;
DROP TABLE if exists LKUP_CD_PARK_PRECIP;
DROP TABLE if exists LKUP_CD_PARK_SKY;
DROP TABLE if exists LKUP_CD_PARK_WIND_DIRECTION;
DROP TABLE if exists LKUP_CD_RECORDER_METHOD;
DROP TABLE if exists LKUP_CD_RECORDER_PITCHES;
DROP TABLE if exists LKUP_ID_BASE;
DROP TABLE if exists LKUP_ID_HOME;
DROP TABLE if exists LKUP_ID_LAST;
CREATE TABLE LKUP_CD_BASES		(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_BATTEDBALL		(VALUE_CD varchar(1),	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_EVENT		(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_FLD		(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_H			(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_HAND		(VALUE_CD varchar(1),	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_PARK_DAYNIGHT	(VALUE_CD varchar(1),	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_PARK_FIELD		(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_PARK_PRECIP	(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_PARK_SKY		(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_PARK_WIND_DIRECTION(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_RECORDER_METHOD	(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_CD_RECORDER_PITCHES	(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_ID_BASE		(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_ID_HOME		(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
CREATE TABLE LKUP_ID_LAST		(VALUE_CD INTEGER,	SHORTNAME_TX varchar(8), LONGNAME_TX varchar(30), DESCRIPTION_TX varchar(255) );
commit;

INSERT INTO LKUP_CD_BASES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, '___', 'Empty', NULL
); 
INSERT INTO LKUP_CD_BASES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, '1__', '1B only', NULL
); 
INSERT INTO LKUP_CD_BASES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, '_2_', '2B only', NULL
); 
INSERT INTO LKUP_CD_BASES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, '12_', '1B & 2B', NULL
); 
INSERT INTO LKUP_CD_BASES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, '__3', '3B only', NULL
); 
INSERT INTO LKUP_CD_BASES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
5, '1_3', '1B & 3B', NULL
); 
INSERT INTO LKUP_CD_BASES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
6, '_23', '2B & 3B', NULL
); 
INSERT INTO LKUP_CD_BASES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
7, '123', 'Loaded', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_BATTEDBALL ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'F', 'FB', 'Fly Ball', NULL
); 
INSERT INTO LKUP_CD_BATTEDBALL ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'G', 'GB', 'Ground Ball', NULL
); 
INSERT INTO LKUP_CD_BATTEDBALL ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'L', 'LD', 'Line Drive', NULL
); 
INSERT INTO LKUP_CD_BATTEDBALL ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'P', 'PU', 'Pop Up', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, 'Out', 'Generic Out', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, 'K', 'Strikeout', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, 'SB', 'Stolen Base', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
5, 'DI', 'Defensive Indifferen', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
6, 'CS', 'Caught Stealing', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
8, 'PK', 'Pickoff', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
9, 'WP', 'Wild Pitch', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
10, 'PB', 'Passed Ball', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
11, 'BK', 'Balk', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
12, 'OA', 'Other Advance', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
13, 'FE', 'Foul Error', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
14, 'NIBB', 'Nonintentional Walk', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
15, 'IBB', 'Intentional Walk', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
16, 'HBP', 'Hit By Pitch', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
17, 'XI', 'Interference', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
18, 'ROE', 'Error', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
19, 'FC', 'Fielder Choice', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
20, '1B', 'Single', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
21, '2B', 'Double', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
22, '3B', 'Triple', NULL
); 
INSERT INTO LKUP_CD_EVENT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
23, 'HR', 'Homerun', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'P', 'Pitcher', NULL
); 
INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, 'C', 'Catcher', NULL
); 
INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, '1B', 'Firstbase', NULL
); 
INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, '2B', 'Secondbase', NULL
); 
INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
5, '3B', 'Thirdbase', NULL
); 
INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
6, 'SS', 'Shortstop', NULL
); 
INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
7, 'LF', 'Leftfield', NULL
); 
INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
8, 'CF', 'Centerfield', NULL
); 
INSERT INTO LKUP_CD_FLD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
9, 'RF', 'Rightfield', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_H ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, '1B', 'Single', NULL
); 
INSERT INTO LKUP_CD_H ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, '2B', 'Double', NULL
); 
INSERT INTO LKUP_CD_H ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, '3B', 'Triple', NULL
); 
INSERT INTO LKUP_CD_H ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, 'HR', 'Homerun', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_HAND ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'?', NULL, 'Unknown', NULL
); 
INSERT INTO LKUP_CD_HAND ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'F', NULL, 'Unknown', NULL
); 
INSERT INTO LKUP_CD_HAND ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'L', 'LH', 'Lefthanded', NULL
); 
INSERT INTO LKUP_CD_HAND ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'R', 'RH', 'Righthanded', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_PARK_DAYNIGHT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'D', 'D', 'Day', NULL
); 
INSERT INTO LKUP_CD_PARK_DAYNIGHT ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
'N', 'N', 'Night', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_PARK_FIELD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'Unknown', 'Unknown', NULL
); 
INSERT INTO LKUP_CD_PARK_FIELD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'Soaked', 'Soaked', NULL
); 
INSERT INTO LKUP_CD_PARK_FIELD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, 'Wet', 'Wet', NULL
); 
INSERT INTO LKUP_CD_PARK_FIELD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, 'Damp', 'Damp', NULL
); 
INSERT INTO LKUP_CD_PARK_FIELD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, 'Dry', 'Dry', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_PARK_PRECIP ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'Unknown', 'Unknown', NULL
); 
INSERT INTO LKUP_CD_PARK_PRECIP ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'None', 'None', NULL
); 
INSERT INTO LKUP_CD_PARK_PRECIP ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, 'Drizzle', 'Drizzle', NULL
); 
INSERT INTO LKUP_CD_PARK_PRECIP ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, 'Showers', 'Showers', NULL
); 
INSERT INTO LKUP_CD_PARK_PRECIP ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, 'Rain', 'Rain', NULL
); 
INSERT INTO LKUP_CD_PARK_PRECIP ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
5, 'Snow', 'Snow', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_PARK_SKY ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'Unknown', 'Unknown', NULL
); 
INSERT INTO LKUP_CD_PARK_SKY ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'Sunny', 'Sunny', NULL
); 
INSERT INTO LKUP_CD_PARK_SKY ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, 'Cloudy', 'Cloudy', NULL
); 
INSERT INTO LKUP_CD_PARK_SKY ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, 'Overcast', 'Overcast', NULL
); 
INSERT INTO LKUP_CD_PARK_SKY ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, 'Night', 'Night', NULL
); 
INSERT INTO LKUP_CD_PARK_SKY ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
5, 'Dome', 'Dome', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'Unknown', 'Unknown', NULL
); 
INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'tolf', 'To LF', NULL
); 
INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, 'tocf', 'To CF', NULL
); 
INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, 'torf', 'To RF', NULL
); 
INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, 'ltor', 'LF to RF', NULL
); 
INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
5, 'fromlf', 'From LF', NULL
); 
INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
6, 'fromcf', 'From CF', NULL
); 
INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
7, 'fromrf', 'From RF', NULL
); 
INSERT INTO LKUP_CD_PARK_WIND_DIRECTION ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
8, 'rtol', 'RF to LF', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_RECORDER_METHOD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'Unknown', 'Unknown', NULL
); 
INSERT INTO LKUP_CD_RECORDER_METHOD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'Park', 'Park', NULL
); 
INSERT INTO LKUP_CD_RECORDER_METHOD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, 'TV', 'TV', NULL
); 
INSERT INTO LKUP_CD_RECORDER_METHOD ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, 'Radio', 'Radio', NULL
); 
COMMIT;

INSERT INTO LKUP_CD_RECORDER_PITCHES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'Unknown', 'Unknown', NULL
); 
INSERT INTO LKUP_CD_RECORDER_PITCHES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'Pitches', 'Pitches', NULL
); 
INSERT INTO LKUP_CD_RECORDER_PITCHES ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, 'Count', 'Count', NULL
); 
COMMIT;

INSERT INTO LKUP_ID_BASE ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'None', 'None', NULL
); 
INSERT INTO LKUP_ID_BASE ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, '1B', 'Firstbase', NULL
); 
INSERT INTO LKUP_ID_BASE ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
2, '2B', 'Secondbase', NULL
); 
INSERT INTO LKUP_ID_BASE ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
3, '3B', 'Thirdbase', NULL
); 
INSERT INTO LKUP_ID_BASE ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
4, 'ER', 'Earned Run', NULL
); 
INSERT INTO LKUP_ID_BASE ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
5, 'UER', 'Unearned Run', NULL
); 
INSERT INTO LKUP_ID_BASE ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
6, 'TUER', 'Team Unearned Run', NULL
); 
COMMIT;

INSERT INTO LKUP_ID_HOME ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'A', 'Away', NULL
); 
INSERT INTO LKUP_ID_HOME ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'H', 'Home', NULL
); 
COMMIT;

INSERT INTO LKUP_ID_LAST ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
0, 'F', 'First', NULL
); 
INSERT INTO LKUP_ID_LAST ( VALUE_CD, SHORTNAME_TX, LONGNAME_TX, DESCRIPTION_TX ) VALUES ( 
1, 'L', 'Last', NULL
); 
COMMIT;
