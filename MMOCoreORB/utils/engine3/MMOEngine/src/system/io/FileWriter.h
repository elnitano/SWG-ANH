/*
** Copyright (C) 2007-2019 SWGEmu
** See file COPYING for copying conditions.
*/
#ifndef FILEWRITER_H_
#define FILEWRITER_H_

#include "File.h"

#include "Writer.h"

#include "FileNotFoundException.h"
#include "IOException.h"

namespace sys {
  namespace io {

	class FileWriterMkDirException : public IOException {
	public:
		FileWriterMkDirException(const String& msg) : IOException(msg) {
		}
	};

	class FileWriterOpenException : public IOException {
	public:
		FileWriterOpenException(const String& msg) : IOException(msg) {
		}
	};

  	class FileWriter : public Writer {
	protected:
  		File* file;
		mutable Mutex validateMutex;
		mutable AtomicBoolean isOpen = false;
		bool append = false;

  	public:
		constexpr const static int bufferLength = 64;

		FileWriter(File* file, bool append = false, bool delayOpen = false) {
  			FileWriter::file = file;
			FileWriter::append = append;

			if (!delayOpen) {
				validateWriteable();
			}
  		}

  		void close() override {
			if (!isOpen.get()) {
				return;
			}

  			validateWriteable();

  			//file->flush(); close already does flush internally

  			file->close();
  		}

  		void flush() override {
			if (!isOpen.get()) {
				return;
			}

  			validateWriteable();

  			file->flush();
  		}

  		int write(const char* str, int len) override {
  			validateWriteable();

  			return fwrite(str, 1, len, file->getDescriptor());
  		}

  		int write(const char* str, uint32 off, int len) override {
  			validateWriteable();

  			file->seek(off);

  			return fwrite((byte*) str, 1, len, file->getDescriptor());
  		}

  		int write(char ch) {
			return write(&ch, 1);
		}

  		int write(int val) {
  			char buf[bufferLength];

			int written = snprintf(buf, sizeof(buf), "%i", val);

			E3_ASSERT(written >= 0 && written < static_cast<int>(sizeof(buf)));

			return write(buf, written);
		}

  		int write(uint32 val) {
  			char buf[bufferLength];

			int written = snprintf(buf, sizeof(buf), "%u", val);

			E3_ASSERT(written >= 0 && written < static_cast<int>(sizeof(buf)));

			return write(buf, written);
		}

  		int write(long val) {
  			char buf[bufferLength];

			int written = snprintf(buf, sizeof(buf), "%ld", val);

			E3_ASSERT(written >= 0 && written < static_cast<int>(sizeof(buf)));

			return write(buf, written);
		}

  		int write(int64 val) {
  			char buf[bufferLength];

			int written = sprintf(buf, "%lld", (long long) val);

			E3_ASSERT(written >= 0 && written < static_cast<int>(sizeof(buf)));

			return write(buf, written);
		}

  		int write(uint64 val) {
  			char buf[bufferLength];

			int written = snprintf(buf, sizeof(buf), "%llu", (unsigned long long) val);

			E3_ASSERT(written >= 0 && written < static_cast<int>(sizeof(buf)));

			return write(buf, written);
		}

  		int write(float val) {
  			char buf[bufferLength];

			int written = snprintf(buf, sizeof(buf), "%f", val);

			E3_ASSERT(written >= 0 && written < static_cast<int>(sizeof(buf)));

			return write(buf, written);
		}

  		int write(const char* str) {
  			return write(str, strlen(str));
  		}

  		int write(const String& str) {
  			return write(str.toCharArray(), str.length());
  		}

  		int writeLine(const String& str) {
  			int written = write(str.toCharArray(), str.length());
			written += write("\n", 1);

			return written;
  		}

  		FileWriter& operator<< (char ch) {
			write(ch);

			return *this;
		}

  		FileWriter& operator<< (int val) {
			write(val);

			return *this;
		}

  		FileWriter& operator<< (uint32 val) {
			write(val);

			return *this;
		}

  		FileWriter& operator<< (long val) {
			write(val);

			return *this;
		}

  		FileWriter& operator<< (int64 val) {
			write(val);

			return *this;
		}

  		FileWriter& operator<< (uint64 val) {
			write(val);

			return *this;
		}

  		FileWriter& operator<< (float val) {
			write(val);

			return *this;
		}

  		FileWriter& operator<< (const char* str) {
			write(str);

			return *this;
		}

  		FileWriter& operator<< (const String& str) {
			write(str);

			return *this;
		}

		FileWriter& operator<< (const StringBuffer& str) {
			write(str.getBuffer(), str.length());

			return *this;
		}

  		inline File* getFile() {
  			return file;
  		}

		inline const File* getFile() const {
  			return file;
  		}

  	protected:
		void validateWriteable() {
			validateMutex.lock();

			try {
				if (!isOpen.get()) {
					if (!file->mkdirs()) {
						throw FileWriterMkDirException(file->getFileName());
					}

					bool success = append ? file->setAppendable() : file->setWriteable();

					if (!success) {
						throw FileWriterOpenException(file->getFileName());
					}

					isOpen.set(true);
				}

				if (!file->exists()) {
					throw FileNotFoundException(file);
				}
			} catch(...) {
				validateMutex.unlock();
				throw;
			}

			validateMutex.unlock();
  		}
  	};
  } // namespace io
} // namespace sys

using namespace sys::io;

#endif /*FILEWRITER_H_*/
