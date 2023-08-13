/*
 * Performance.h
 *
 *  Created on: 19/08/2010
 *      Author: victor
 */

#ifndef PERFORMANCE_H_
#define PERFORMANCE_H_

#include "templates/datatables/DataTableRow.h"

class PerformanceType {
public:
	enum {
		DANCE  = -1788534963,
		MUSIC  = 866729052
	};

};

class Performance {
	int performanceIndex;
	String performanceName;
	int instrumentAudioId;
	String requiredSong;
	String requiredInstrument;
	String requiredDance;
	int danceVisualId;
	int actionPointsPerLoop;
	float loopDuration;
	int type;
	int baseXp;
	int flourishXpMod;
	int healMindWound;
	int healShockWound;
	String requiredSkillMod;
	int requiredSkillModValue;
	String mainloop;
	String flourish1;
	String flourish2;
	String flourish3;
	String flourish4;
	String flourish5;
	String flourish6;
	String flourish7;
	String flourish8;
	String intro;
	String outro;

public:

	inline bool isDance() {
		return type == PerformanceType::DANCE;
	}

	inline bool isMusic() {
		return type == PerformanceType::MUSIC;
	}

	inline String& getName() {
		return performanceName;
	}

	inline String& getRequiredSong() {
		return requiredSong;
	}

	inline String& getRequiredInstrument() {
		return requiredInstrument;
	}

	inline String& getRequiredDance() {
		return requiredDance;
	}

	inline String& getRequiredSkillMod() {
		return requiredSkillMod;
	}

	inline String& getMainloop() {
		return mainloop;
	}

	inline String& getFlourish1() {
		return requiredDance;
	}

	inline String& getFlourish2() {
		return requiredDance;
	}

	inline String& getFlourish3() {
		return flourish3;
	}

	inline String& getFlourish4() {
		return flourish4;
	}

	inline String& getFlourish5() {
		return flourish5;
	}

	inline String& getFlourish6() {
		return flourish6;
	}

	inline String& getFlourish7() {
		return flourish7;
	}

	inline String& getFlourish8() {
		return flourish8;
	}

	inline String& getIntro() {
		return intro;
	}

	inline String& getOutro() {
		return outro;
	}

	inline int getInstrumentAudioId() {
		return instrumentAudioId;
	}
	inline int getDanceVisualId() {
		return danceVisualId;
	}

	inline int getActionPointsPerLoop() {
		return actionPointsPerLoop;
	}

	inline int getType() {
		return type;
	}

	inline int getBaseXp() {
		return baseXp;
	}

	inline int getFlourishXpMod(int idx) {
		if(idx < 1){
			idx = 1;
		}
		if(idx > 130){
			return flourishXpMod; // Return original Xp if dancing
		}
		int array_start_at_zero = idx - 1;
		int new_flourishMod[] = {
			//Musician Flourish Exp
			//
			//Instrument list:
			//Slitherhorn, Fizz, Fanfar, Kloohorn, Mandoviol, Traz, Bandfill, Flutedroopy, Omnibox, Nalargon
			4, 12, 16, 20, 26, 28, 36, 40, 44, 48, //starwars1
			8, 12, 16, 20, 26, 28, 36, 40, 44, 48, //rock
			12, 12, 16, 20, 26, 28, 36, 40, 44, 48, //starwars2
			6, 6, 6, 20, 26, 28, 36, 40, 44, 48, //folk
			20, 20, 20, 20, 26, 28, 36, 40, 44, 48, //starwars3
			26, 26, 26, 26, 26, 28, 36, 40, 44, 48, //ceremonial
			32, 32, 32, 32, 32, 32, 36, 40, 44, 48, //ballad
			40, 40, 40, 40, 40, 40, 40, 40, 44, 48, //waltz
			44, 44, 44, 44, 44, 44, 44, 44, 44, 48, //jazz
			48, 48, 48, 48, 48, 48, 48, 48, 48, 48, //virtuoso
			40, 40, 40, 40, 40, 40, 40, 40, 44, 48, //western
			28, 28, 28, 28, 28, 28, 36, 40, 44, 48, //starwars4
			36, 36, 36, 36, 36, 36, 36, 44, 44, 48, //funk
		};

		return new_flourishMod[array_start_at_zero];
	}

	inline int getHealMindWound() {
		return healMindWound;
	}

	inline int getHealShockWound() {
		return healShockWound;
	}

	inline int getRequiredSkillModValue() {
		return requiredSkillModValue;
	}

	inline float getLoopDuration() {
		return loopDuration;
	}

	inline int getPerformanceIndex() {
		return performanceIndex;
	}

	void parseDataTableRow(int idx, DataTableRow* row) {
		performanceIndex = idx;
		row->getValue(0, performanceName);
		row->getValue(1, instrumentAudioId);
		row->getValue(2, requiredSong);
		row->getValue(3, requiredInstrument);
		row->getValue(4, requiredDance);
		row->getValue(5, danceVisualId);
		row->getValue(6, actionPointsPerLoop);
		row->getValue(7, loopDuration);

		uint32 typeHex;
		row->getValue(8, typeHex);

		if ((int)typeHex == PerformanceType::MUSIC)	{
			type = PerformanceType::MUSIC;
		} else if ((int)typeHex == PerformanceType::DANCE) {
			type = PerformanceType::DANCE;
		}

		row->getValue(9, baseXp);
		row->getValue(10, flourishXpMod);
		row->getValue(11, healMindWound);
		row->getValue(12, healShockWound);
		row->getValue(13, requiredSkillMod);
		row->getValue(14, requiredSkillModValue);
		row->getValue(15, mainloop);
		row->getValue(16, flourish1);
		row->getValue(17, flourish2);
		row->getValue(18, flourish3);
		row->getValue(19, flourish4);
		row->getValue(20, flourish5);
		row->getValue(21, flourish6);
		row->getValue(22, flourish7);
		row->getValue(23, flourish8);
		row->getValue(24, intro);
		row->getValue(25, outro);
	}

};



#endif /* PERFORMANCE_H_ */
