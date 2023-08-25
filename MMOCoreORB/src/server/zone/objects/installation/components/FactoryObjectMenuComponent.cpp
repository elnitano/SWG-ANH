
Project
Core3
.git
MMOCoreORB
.externalToolBuilders
.settings
bin
build
cmake
doc
docker
helm
sql
src
autogen
client
conf
odb
pathfinding
server
chat
db
features
login
metrics
ping
status
utils
web
zone
managers
objects
area
auction
building
cell
creature
draftschematic
factorycrate
group
guild
installation
components
factory
sui
tasks
FactoryHopperObserver.idl
FactoryObject.idl
FactoryObjectImplementation.cpp
garage
generator
GeneratorObject.idl
GeneratorObjectImplementation.cpp
harvester
HarvesterObject.idl
HarvesterObjectImplementation.cpp
shuttle
sui
HopperList.h
InstallationObject.idl
InstallationObjectImplementation.cpp
SyncrhonizedUiListenInstallationTask.h
intangible
manufactureschematic
mission
pathfinding
player
region
resource
scene
ship
staticobject
structure
tangible
transaction
waypoint
packets
auction
building
cell
charcreation
chat
creature
factory
group
guild
harvester
HarvesterObjectDeltaMessage3.h
HarvesterObjectMessage3.h
HarvesterObjectMessage6.h
HarvesterObjectMessage7.h
HarvesterResourceDataMessage.h
ResourceHarvesterActivatePageMessage.h
installation
HarvesterSetupSharedNetworkMessage.h
InstallationObjectDeltaMessage3.h
InstallationObjectDeltaMessage6.h
InstallationObjectDeltaMessage7.h
InstallationObjectMessage3.h
InstallationObjectMessage6.h
InstallationObjectMessage7.h
intangible
jtl
lair
manufactureschematic
mission
object
player
resource
scene
ship
static
tangible
trade
ui
zone
BaseLineMessage.h
DeltaMessage.h
HeartBeat.h
LinkDeadMessage.h
MessageCallback.h
ActiveAreaQuadTree.cpp
ActiveAreaQuadTree.h
ActiveAreasVector.h
CloseObjectsVector.cpp
CloseObjectsVector.h
InRangeObjectsVector.h
MessageCallbackFactory.h
QuadTree.cpp
QuadTree.h
QuadTreeEntry.idl
QuadTreeEntryImplementation.cpp
QuadTreeNode.h
QuadTreeReference.cpp
QuadTreeReference.h
ShutdownTask.h
Zone.idl
ZoneClientSession.idl
ZoneClientSessionImplementation.cpp
ZoneContainerComponent.cpp
ZoneContainerComponent.h
ZoneHandler.h
ZoneImplementation.cpp
ZoneLoadManagersTask.h
ZonePacketHandler.cpp
ZonePacketHandler.h
ZoneProcessServer.idl
ZoneProcessServerImplementation.cpp
ZoneReference.cpp
ZoneReference.h
ZoneServer.idl
ZoneServerImplementation.cpp
ServerCore.cpp
ServerCore.h
templates
appearance
building
collision
crafting
draftslot
resourceweight
AtributesMapImplementation.cpp
AttributesMap.h
ValuesClasses.h
crcstringtable
creation
creature
customization
datatables
faction
footprint
installation
intangible
manager
mobile
params
resource
slots
snapshot
WorldSnapshotIff.cpp
WorldSnapshotIff.h
WorldSnapshotNode.h
string
tangible
universe
ChildCreatureObject.h
ChildObject.h
CMakeLists.txt
IffTemplate.h
LootGroupTemplate.h
LootItemTemplate.h
LuaTemplate.h
SharedCellObjectTemplate.h
SharedIntangibleObjectTemplate.h
SharedObjectTemplate.cpp
SharedObjectTemplate.h
SharedStaticObjectTemplate.h
SharedTangibleObjectTemplate.cpp
SharedTangibleObjectTemplate.h
SharedUniverseObjectTemplate.h
TemplateData.h
TemplateReference.h
terrain
tests
tre3
.gitignore
CMakeLists.txt
CoreProcess.h
main.cpp
utils
.cdtproject
.clang_complete
.clang-format
.cproject
.gitignore
.project
AUTHORS
ChangeLog
CMakeLists.txt
codetemplates.xml
COPYING
Makefile
NEWS
README
README.osx
suppressions.txt
.gitignore
.gitmodules
COPYING
README.md
config.lua
RadialOptions.h
HarvesterActivateCommand.h
HarvesterDeactivateCommand.h
InstallationObject.idl
InstallationObjectImplementation.cpp
FactoryObjectMenuComponent.cpp
FactoryObject.idl
FactoryObjectImplementation.cpp
GeneratorObjectImplementation.cpp
HarvesterObjectImplementation.cpp
HarvesterObjectMessage7.h
InstallationObjectMessage7.h
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
 
#include "FactoryObjectMenuComponent.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/packets/object/ObjectMenuResponse.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/installation/factory/FactoryObject.h"
#include "server/zone/managers/radial/RadialOptions.h"
 
void FactoryObjectMenuComponent::fillObjectMenuResponse(SceneObject* sceneObject, ObjectMenuResponse* menuResponse, CreatureObject* player) const {
  if (!sceneObject->isFactory())
    return;
 
  FactoryObject* factory = cast<FactoryObject*>(sceneObject);
 
  if (!factory->isOnAdminList(player))
    return;
 
  InstallationObjectMenuComponent::fillObjectMenuResponse(sceneObject, menuResponse, player);
 
  menuResponse->addRadialMenuItem(29, 3, "@manf_station:options"); //Options
 
  if(factory->getContainerObjectsSize() > 0) {
    if(!factory->isActive()) {
      menuResponse->addRadialMenuItemToRadialID(RadialOptions::CRAFT_OPTIONS, RadialOptions::SERVER_MENU2, 3, "@manf_station:activate"); //Start manufacturing objects.
      menuResponse->addRadialMenuItemToRadialID(RadialOptions::CRAFT_OPTIONS, RadialOptions::SERVER_MENU1, 3, "@manf_station:ingredients"); //List ingredients needed for station
    } else {
      menuResponse->addRadialMenuItemToRadialID(RadialOptions::CRAFT_OPTIONS, RadialOptions::SERVER_MENU2, 3, "@manf_station:deactivate"); //Stop manufacturing objects.
    }
  }
 
  if(!factory->isActive()) {
    menuResponse->addRadialMenuItemToRadialID(RadialOptions::CRAFT_OPTIONS, RadialOptions::SERVER_MANF_STATION_SCHEMATIC, 3, "@manf_station:schematic"); //Access schematic slot.
    menuResponse->addRadialMenuItemToRadialID(RadialOptions::CRAFT_OPTIONS, RadialOptions::SERVER_MANF_HOPPER_INPUT, 3, "@manf_station:input_hopper"); //Access station ingredient hopper
    menuResponse->addRadialMenuItemToRadialID(RadialOptions::CRAFT_OPTIONS, RadialOptions::SERVER_MANF_HOPPER_OUTPUT, 3, "@manf_station:output_hopper"); //Access station output hopper
  }
}
 
int FactoryObjectMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* player, byte selectedID) const {
  if (!sceneObject->isFactory())
    return 1;
 
  FactoryObject* factory = cast<FactoryObject*>(sceneObject);
￼
  
No results found for 'timer ='Finding with Options: Case Insensitive￼
￼
￼
￼
timer =
￼
 
no results
￼Find
￼Find All
 
Replace in current buffer￼
￼Replace
￼Replace All
MMOCoreORB/src/server/zone/objects/installation/components/FactoryObjectMenuComponent.cpp32:11
LFUTF-8C++
unstable1654 files
