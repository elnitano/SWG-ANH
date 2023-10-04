/*
** Copyright (C) 2007-2019 SWGEmu
** See file COPYING for copying conditions.
*/

#ifndef ATOMICBOOLEAN_H_
#define ATOMICBOOLEAN_H_

#include "system/platform.h"

#include "system/lang/Variable.h"

#include "system/io/ObjectInputStream.h"
#include "system/io/ObjectOutputStream.h"

#include <atomic>

namespace sys {
  namespace thread {
	namespace atomic {

	class AtomicBoolean : public Variable {
		std::atomic<bool> value{false};

	public:
		AtomicBoolean() {
		}

		AtomicBoolean(bool val) : value(val) {
		}

		AtomicBoolean(AtomicBoolean&& val) : value(val.value.load(std::memory_order_seq_cst)) {
		}

		AtomicBoolean(const AtomicBoolean& val) : value(val.value.load(std::memory_order_seq_cst)) {
		}

		~AtomicBoolean() {
		}

		bool compareAndSet(bool oldval, bool newval) {
			return value.compare_exchange_strong(oldval, newval);
		}

		bool get(std::memory_order m = std::memory_order_relaxed) const {
			return value.load(m);
		}

		void set(bool val, std::memory_order m = std::memory_order_relaxed) {
			value.store(val, m);
		}

		AtomicBoolean& operator=(const bool val) {
			value = val;

			return *this;
		}

		bool operator== (const bool val) const {
			return val == value.load(std::memory_order_relaxed);
		}

		operator bool() const {
			return value.load(std::memory_order_seq_cst);
		}

		bool toBinaryStream(sys::io::ObjectOutputStream* stream) NO_THREAD_SAFETY_ANALYSIS {
			stream->writeInt(value);

			return true;
		}

		bool parseFromBinaryStream(sys::io::ObjectInputStream* stream) NO_THREAD_SAFETY_ANALYSIS {
			*this = stream->readInt();

			return true;
		}
	};

	} // namespace atomic
  } // namespace thread
} //namespace sys

using namespace sys::thread::atomic;

#endif /* ATOMICBOOLEAN_H_ */
