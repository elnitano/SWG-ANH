/*
** Copyright (C) 2007-2019 SWGEmu
** See file COPYING for copying conditions.
*/

#pragma once

#include <functional>

#include "system/io/ObjectOutputStream.h"
#include "system/io/ObjectInputStream.h"

namespace sys {
  namespace lang {

	class Double : public BaseTypeVariable<double> {
	public:
		inline Double() : BaseTypeVariable<double>(0) {

		}

		inline Double(double val) : BaseTypeVariable<double>(val) {

		}

		inline Double(const Double& val) : BaseTypeVariable<double>(val) {

		}

		inline Double& operator=(const Double& val) {
			if (this == &val) {
				return *this;
			}

			BaseTypeVariable<double>::operator=(val);

			return *this;
		}

		bool parseFromString(const String& str, int version = 0) {
			*this = valueOf(str);

			return true;
		}

		bool toString(String& str) const {
			str = String::valueOf(*this);

			return true;
		}

		bool toBinaryStream(ObjectOutputStream* stream) {
			stream->writeFloat(get());

			return true;
		}

		bool parseFromBinaryStream(ObjectInputStream* stream) {
			*this = stream->readFloat();

			return true;
		}

		static float valueOf(const String& str) {
			return atof(str.toCharArray());
		}

		static uint32 hashCode(double value) {
			return (uint32) std::hash<double>{}(value);
		}

	};

  } // namespace lang
} // namespace sys

using namespace sys::lang;

