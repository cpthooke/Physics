#include "PhysicsEngine.h"
#include <iostream>

namespace PhysicsEngine
{
	using namespace physx;
	using namespace std;

	///Default error and allocator callbacks
	PxDefaultErrorCallback gDefaultErrorCallback;
	PxDefaultAllocator gDefaultAllocatorCallback;

	///PhysX objects
	PxFoundation* foundation = 0;
	debugger::comm::PvdConnection* vd_connection = 0;
	PxPhysics* physics = 0;
	PxCooking* cooking = 0;

	///PhysX functions
	void PxInit()
	{
		if (!foundation)
			foundation = PxCreateFoundation(PX_PHYSICS_VERSION, gDefaultAllocatorCallback, gDefaultErrorCallback);

		if(!foundation)
			throw new Exception("PhysicsEngine::PxInit, Could not create the PhysX SDK foundation.");

		if (!physics)
			physics = PxCreatePhysics(PX_PHYSICS_VERSION, *foundation, PxTolerancesScale());

		if(!physics)
			throw new Exception("PhysicsEngine::PxInit, Could not initialise the PhysX SDK.");

		if (!cooking)
			cooking = PxCreateCooking(PX_PHYSICS_VERSION, *foundation, PxCookingParams(PxTolerancesScale()));

		if(!cooking)
			throw new Exception("PhysicsEngine::PxInit, Could not initialise the cooking component.");

		if (!vd_connection) //Visual debugger
			vd_connection = PxVisualDebuggerExt::createConnection(physics->getPvdConnectionManager(), 
			"localhost", 5425, 100, PxVisualDebuggerExt::getAllConnectionFlags());

		CreateMaterial(); //Create a deafult material
	}

	void PxRelease()
	{
		if (vd_connection)
			vd_connection->release();
		if (cooking)
			cooking->release();
		if (physics)
			physics->release();
		if (foundation)
			foundation->release();
	}

	PxPhysics* GetPhysics() 
	{ 
		return physics; 
	}

	PxCooking* GetCooking()
	{
		return cooking;
	}

	PxMaterial* GetMaterial(PxU32 index)
	{
		std::vector<PxMaterial*> materials(physics->getNbMaterials());
		if (index < physics->getMaterials((PxMaterial**)&materials.front(), (PxU32)materials.size()))
			return materials[index];
		else
			return 0;
	}

	PxMaterial* CreateMaterial(PxReal sf, PxReal df, PxReal cr) 
	{
		return physics->createMaterial(sf, df, cr);
	}

	///Actor methods
	PxActor* Actor::Get() //Constructor
	{
		return actor;
	}

	void Actor::Color(PxVec3 new_color, PxU32 shape_index)
	{
		if (shape_index == -1) //Change color of all shapes
		{
			for (unsigned int i = 0; i < colors.size(); i++)
				colors[i] = new_color;
		}

		else if (shape_index < colors.size()) //Or only the selected one
		{
			colors[shape_index] = new_color;
		}
	}

	const PxVec3* Actor::Color(PxU32 shape_indx)
	{
		if (shape_indx < colors.size())
			return &colors[shape_indx];
		else 
			return 0;			
	}

	void Actor::Material(PxMaterial* new_material, PxU32 shape_index)
	{
		std::vector<PxShape*> shape_list = GetShapes(shape_index);
		for (PxU32 i = 0; i < shape_list.size(); i++)
		{
			std::vector<PxMaterial*> materials(shape_list[i]->getNbMaterials());
			for (unsigned int j = 0; j < materials.size(); j++)
				materials[j] = new_material;
			shape_list[i]->setMaterials(materials.data(), (PxU16)materials.size());
		}
	}

	PxShape* Actor::GetShape(PxU32 index)
	{
		std::vector<PxShape*> shapes(((PxRigidActor*)actor)->getNbShapes());
		if (index < ((PxRigidActor*)actor)->getShapes((PxShape**)&shapes.front(), (PxU32)shapes.size()))
			return shapes[index];
		else
			return 0;
	}

	std::vector<PxShape*> Actor::GetShapes(PxU32 index)
	{
		std::vector<PxShape*> shapes(((PxRigidActor*)actor)->getNbShapes());
		((PxRigidActor*)actor)->getShapes((PxShape**)&shapes.front(), (PxU32)shapes.size());
		if (index == -1)
			return shapes;
		else if (index < shapes.size())
		{
			return std::vector<PxShape*>(1, shapes[index]);
		}
		else
			return std::vector<PxShape*>();
	}

	void Actor::SetTrigger(bool value, PxU32 shape_index)
	{
		std::vector<PxShape*> shape_list = GetShapes(shape_index);
		for (PxU32 i = 0; i < shape_list.size(); i++)
		{
			shape_list[i]->setFlag(PxShapeFlag::eSIMULATION_SHAPE, !value);
			shape_list[i]->setFlag(PxShapeFlag::eTRIGGER_SHAPE, value);
		}
	}

	void Actor::SetupFiltering(PxU32 filterGroup, PxU32 filterMask, PxU32 shape_index)
	{
		std::vector<PxShape*> shape_list = GetShapes(shape_index);
		for (PxU32 i = 0; i < shape_list.size(); i++)
			shape_list[i]->setSimulationFilterData(PxFilterData(filterGroup, filterMask,0,0));
	}

	void Actor::Name(const string& new_name)
	{
		name = new_name;
		actor->setName(name.c_str());
	}

	string Actor::Name()
	{
		return name;
	}

	DynamicActor::DynamicActor(const PxTransform& pose) : Actor()
	{
		actor = (PxActor*)GetPhysics()->createRigidDynamic(pose);
		Name("");
	}

	DynamicActor::~DynamicActor()
	{
		for (unsigned int i = 0; i < colors.size(); i++)
			delete (UserData*)GetShape(i)->userData;
	}

	void DynamicActor::CreateShape(const PxGeometry& geometry, PxReal density)
	{
		PxShape* shape = ((PxRigidDynamic*)actor)->createShape(geometry,*GetMaterial());
		PxRigidBodyExt::updateMassAndInertia(*(PxRigidDynamic*)actor, density);
		colors.push_back(default_color);
		shape->userData = new UserData(); //Pass the color pointers to the renderer
		for (unsigned int i = 0; i < colors.size(); i++)
			((UserData*)GetShape(i)->userData)->color = &colors[i];
	}

	void DynamicActor::SetKinematic(bool value, PxU32 index)
	{
		((PxRigidDynamic*)actor)->setRigidDynamicFlag(PxRigidDynamicFlag::eKINEMATIC, value);
	}

	StaticActor::StaticActor(const PxTransform& pose)
	{
		actor = (PxActor*)GetPhysics()->createRigidStatic(pose);
		Name("");
	}

	StaticActor::~StaticActor()
	{
		for (unsigned int i = 0; i < colors.size(); i++)
			delete (UserData*)GetShape(i)->userData;
	}

	void StaticActor::CreateShape(const PxGeometry& geometry, PxReal density)
	{
		PxShape* shape = ((PxRigidStatic*)actor)->createShape(geometry,*GetMaterial());
		colors.push_back(default_color);
		shape->userData = new UserData(); //Pass the color pointers to the renderer
		for (unsigned int i = 0; i < colors.size(); i++)
			((UserData*)GetShape(i)->userData)->color = &colors[i];
	}

	///Scene methods
	void Scene::Init()
	{
		PxSceneDesc sceneDesc(GetPhysics()->getTolerancesScale()); //Scene

		if(!sceneDesc.cpuDispatcher)
		{
			PxDefaultCpuDispatcher* mCpuDispatcher = PxDefaultCpuDispatcherCreate(1);
			sceneDesc.cpuDispatcher = mCpuDispatcher;
		}

		sceneDesc.filterShader = filter_shader;
		
		px_scene = GetPhysics()->createScene(sceneDesc);

		if (!px_scene)
			throw new Exception("PhysicsEngine::Scene::Init, Could not initialise the scene.");

		px_scene->setGravity(PxVec3(0.0f, -9.81f, 0.0f)); //Default gravity

		CustomInit();

		pause = false;

		selected_actor = 0;

		SelectNextActor();
	}

	void Scene::Update(PxReal dt)
	{
		if (pause)
			return;

		CustomUpdate();

		px_scene->simulate(dt);
		px_scene->fetchResults(true);
	}

	void Scene::Add(Actor* actor)
	{
		px_scene->addActor(*actor->Get());
	}

	PxScene* Scene::Get() 
	{ 
		return px_scene; 
	}

	void Scene::Reset()
	{
		px_scene->release();
		Init();
	}

	void Scene::Pause(bool value)
	{
		pause = value;
	}

	bool Scene::Pause() 
	{ 
		return pause;
	}

	PxRigidDynamic* Scene::GetSelectedActor()
	{
		return selected_actor;
	}

	PxRigidDynamic* Scene::GetPaddleActor()
	{
		return paddle_actor;
	}

	PxRigidDynamic* Scene::GetBallActor()
	{
		return ball_actor;
	}

	PxRigidDynamic* Scene::GetTopWallActor()
	{
		return top_wall_actor;
	}

	void Scene::SelectNextActor()
	{
		std::vector<PxRigidDynamic*> actors(px_scene->getNbActors(PxActorTypeSelectionFlag::eRIGID_DYNAMIC));
		if (actors.size() && (px_scene->getActors(PxActorTypeSelectionFlag::eRIGID_DYNAMIC, (PxActor**)&actors.front(), (PxU32)actors.size())))
		{
			if (selected_actor)
			{
				for (unsigned int i = 0; i < actors.size(); i++)
					if (selected_actor == actors[i]) //Selects and highlights the next actor
					{
						HighlightOff(selected_actor);
						selected_actor = actors[(i+1)%actors.size()];
						paddle_actor = actors[3];
						break;
					}
			}
			else
			{
				selected_actor = actors[0];
				paddle_actor = actors[3];
			}
			HighlightOn(selected_actor);
		}
		else
		{
			selected_actor = 0;
			paddle_actor = 0;
		}
	}

	std::vector<PxActor*> Scene::GetAllActors()
	{
		physx::PxActorTypeSelectionFlags selection_flag = PxActorTypeSelectionFlag::eRIGID_DYNAMIC | PxActorTypeSelectionFlag::eRIGID_STATIC | 
			PxActorTypeSelectionFlag::eCLOTH;
		std::vector<PxActor*> actors(px_scene->getNbActors(selection_flag));
		px_scene->getActors(selection_flag, (PxActor**)&actors.front(), (PxU32)actors.size());
		return actors;
	}

	void Scene::HighlightOn(PxRigidDynamic* actor)
	{
		std::vector<PxShape*> shapes(actor->getNbShapes()); //Store the original colour and adjust brightness of the selected actor
		actor->getShapes((PxShape**)&shapes.front(), (PxU32)shapes.size());

		sactor_color_orig.clear();

		for (unsigned int i = 0; i < shapes.size(); i++)
		{
			PxVec3* color = ((UserData*)shapes[i]->userData)->color;
			sactor_color_orig.push_back(*color);
			*color += PxVec3(.2f,.2f,.2f);
		}
	}

	void Scene::HighlightOff(PxRigidDynamic* actor)
	{
		std::vector<PxShape*> shapes(actor->getNbShapes()); //Restore the original color
		actor->getShapes((PxShape**)&shapes.front(), (PxU32)shapes.size());

		for (unsigned int i = 0; i < shapes.size(); i++)
			*((UserData*)shapes[i]->userData)->color = sactor_color_orig[i];
	}
}
