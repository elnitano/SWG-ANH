/*
 *	engine/core/util/ManagedVector.cpp generated by engine3 IDL compiler 0.70
 */

#include "ManagedVector.h"

/*
 *	ManagedVectorStub
 */

ManagedVector::ManagedVector(DummyConstructorParameter* param) : ManagedObject(param) {
	_setClassName("ManagedVector");
}

ManagedVector::~ManagedVector() {
}



DistributedObjectServant* ManagedVector::_getImplementation() {

	 if (!_updated) _updated = true;
	return _impl;
}

DistributedObjectServant* ManagedVector::_getImplementationForRead() const {
	return _impl;
}

void ManagedVector::_setImplementation(DistributedObjectServant* servant) {
	_impl = servant;
}

/*
 *	ManagedVectorImplementation
 */

ManagedVectorImplementation::ManagedVectorImplementation() : ManagedObjectImplementation() {
	_initializeImplementation();
}

ManagedVectorImplementation::ManagedVectorImplementation(DummyConstructorParameter* param) : ManagedObjectImplementation(param) {
	_initializeImplementation();
}


ManagedVectorImplementation::~ManagedVectorImplementation() {
}


void ManagedVectorImplementation::finalize() {
}

void ManagedVectorImplementation::_initializeImplementation() {
	_setClassHelper(ManagedVectorHelper::instance());

	_this = nullptr;

	_serializationHelperMethod();
}

void ManagedVectorImplementation::_setStub(DistributedObjectStub* stub) {
	_this = static_cast<ManagedVector*>(stub);
	ManagedObjectImplementation::_setStub(stub);
}

DistributedObjectStub* ManagedVectorImplementation::_getStub() {
	return _this.get();
}

ManagedVectorImplementation::operator const ManagedVector*() {
	return _this.get();
}

void ManagedVectorImplementation::lock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->lock(doLock);
}

void ManagedVectorImplementation::lock(ManagedObject* obj) {
	_this.getReferenceUnsafeStaticCast()->lock(obj);
}

void ManagedVectorImplementation::rlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->rlock(doLock);
}

void ManagedVectorImplementation::wlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->wlock(doLock);
}

void ManagedVectorImplementation::wlock(ManagedObject* obj) {
	_this.getReferenceUnsafeStaticCast()->wlock(obj);
}

void ManagedVectorImplementation::unlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->unlock(doLock);
}

void ManagedVectorImplementation::runlock(bool doLock) {
	_this.getReferenceUnsafeStaticCast()->runlock(doLock);
}

void ManagedVectorImplementation::_serializationHelperMethod() {
	ManagedObjectImplementation::_serializationHelperMethod();

	_setClassName("ManagedVector");

}

void ManagedVectorImplementation::readObject(ObjectInputStream* stream) {
	uint16 _varCount = stream->readShort();
	for (int i = 0; i < _varCount; ++i) {
		uint32 _nameHashCode;
		TypeInfo<uint32>::parseFromBinaryStream(&_nameHashCode, stream);

		uint32 _varSize = stream->readInt();

		int _currentOffset = stream->getOffset();

		if(ManagedVectorImplementation::readObjectMember(stream, _nameHashCode)) {
		}

		stream->setOffset(_currentOffset + _varSize);
	}

	initializeTransientMembers();
}

bool ManagedVectorImplementation::readObjectMember(ObjectInputStream* stream, const uint32& nameHashCode) {
	if (ManagedObjectImplementation::readObjectMember(stream, nameHashCode))
		return true;

	switch(nameHashCode) {
	}

	return false;
}

void ManagedVectorImplementation::writeObject(ObjectOutputStream* stream) {
	int _currentOffset = stream->getOffset();
	stream->writeShort(0);
	int _varCount = ManagedVectorImplementation::writeObjectMembers(stream);
	stream->writeShort(_currentOffset, _varCount);
}

int ManagedVectorImplementation::writeObjectMembers(ObjectOutputStream* stream) {
	int _count = ManagedObjectImplementation::writeObjectMembers(stream);

	uint32 _nameHashCode;
	int _offset;
	uint32 _totalSize;

	return _count;
}

/*
 *	ManagedVectorAdapter
 */


#include "engine/orb/messages/InvokeMethodMessage.h"


ManagedVectorAdapter::ManagedVectorAdapter(ManagedVector* obj) : ManagedObjectAdapter(obj) {
}

void ManagedVectorAdapter::invokeMethod(uint32 methid, DistributedMethod* inv) {
	DOBMessage* resp = inv->getInvocationMessage();

	switch (methid) {
	default:
		ManagedObjectAdapter::invokeMethod(methid, inv);
	}
}

/*
 *	ManagedVectorHelper
 */

ManagedVectorHelper* ManagedVectorHelper::staticInitializer = ManagedVectorHelper::instance();

ManagedVectorHelper::ManagedVectorHelper() {
	className = "ManagedVector";

	Core::getObjectBroker()->registerClass(className, this);
}

void ManagedVectorHelper::finalizeHelper() {
	ManagedVectorHelper::finalize();
}

DistributedObject* ManagedVectorHelper::instantiateObject() {
	return new ManagedVector(DummyConstructorParameter::instance());
}

DistributedObjectServant* ManagedVectorHelper::instantiateServant() {
	return new ManagedVectorImplementation(DummyConstructorParameter::instance());
}

DistributedObjectPOD* ManagedVectorHelper::instantiatePOD() {
	return new ManagedVectorPOD();
}

DistributedObjectAdapter* ManagedVectorHelper::createAdapter(DistributedObjectStub* obj) {
	DistributedObjectAdapter* adapter = new ManagedVectorAdapter(static_cast<ManagedVector*>(obj));

	obj->_setClassName(className);
	obj->_setClassHelper(this);

	adapter->setStub(obj);

	return adapter;
}

/*
 *	ManagedVectorPOD
 */

ManagedVectorPOD::~ManagedVectorPOD() {
}

ManagedVectorPOD::ManagedVectorPOD(void) {
	_className = "ManagedVector";
}


void ManagedVectorPOD::writeObject(ObjectOutputStream* stream) {
	int _currentOffset = stream->getOffset();
	stream->writeShort(0);
	int _varCount = ManagedVectorPOD::writeObjectMembers(stream);
	stream->writeShort(_currentOffset, _varCount);
}

int ManagedVectorPOD::writeObjectMembers(ObjectOutputStream* stream) {
	int _count = ManagedObjectPOD::writeObjectMembers(stream);

	uint32 _nameHashCode;
	int _offset;
	uint32 _totalSize;

	return _count;
}

bool ManagedVectorPOD::readObjectMember(ObjectInputStream* stream, const uint32& nameHashCode) {
	if (ManagedObjectPOD::readObjectMember(stream, nameHashCode))
		return true;

	switch(nameHashCode) {
	}

	return false;
}

void ManagedVectorPOD::readObject(ObjectInputStream* stream) {
	uint16 _varCount = stream->readShort();
	for (int i = 0; i < _varCount; ++i) {
		uint32 _nameHashCode;
		TypeInfo<uint32>::parseFromBinaryStream(&_nameHashCode, stream);

		uint32 _varSize = stream->readInt();

		int _currentOffset = stream->getOffset();

		if(ManagedVectorPOD::readObjectMember(stream, _nameHashCode)) {
		}

		stream->setOffset(_currentOffset + _varSize);
	}

}

void ManagedVectorPOD::writeObjectCompact(ObjectOutputStream* stream) {
	ManagedObjectPOD::writeObjectCompact(stream);


}

