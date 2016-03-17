#pragma once

#include "BasicActors.h"
#include <iostream>
#include <iomanip>

namespace PhysicsEngine
{
	using namespace std;

	static const PxVec3 color_palette[] = {PxVec3(46.f/255.f,9.f/255.f,39.f/255.f),PxVec3(217.f/255.f,0.f/255.f,0.f/255.f),
		PxVec3(255.f/255.f,45.f/255.f,0.f/255.f),PxVec3(255.f/255.f,140.f/255.f,54.f/255.f),PxVec3(4.f/255.f,117.f/255.f,111.f/255.f)};

	///Pyramid vertices
	static PxVec3 pyramid_verts[] = {PxVec3(0,1,0), PxVec3(1,0,0), PxVec3(-1,0,0), PxVec3(0,0,1), PxVec3(0,0,-1)};
	//Pyramid triangles: a list of three vertices for each triangle e.g. the first triangle consists of vertices 1, 4 and 0
	//Vertices have to be specified in a counter-clockwise order to assure the correct shading in rendering
	static PxU32 pyramid_trigs[] = {1, 4, 0, 3, 1, 0, 2, 3, 0, 4, 2, 0, 3, 2, 1, 2, 4, 1};

	class Pyramid : public ConvexMesh
	{
	public:
		Pyramid(PxTransform pose=PxTransform(PxIdentity), PxReal density=1.f) :
			ConvexMesh(vector<PxVec3>(begin(pyramid_verts),end(pyramid_verts)), pose, density)
		{
		}
	};

	class PyramidStatic : public TriangleMesh
	{
	public:
		PyramidStatic(PxTransform pose=PxTransform(PxIdentity)) :
			TriangleMesh(vector<PxVec3>(begin(pyramid_verts),end(pyramid_verts)), vector<PxU32>(begin(pyramid_trigs),end(pyramid_trigs)), pose)
		{
		}
	};

	struct FilterGroup
	{
		enum Enum
		{
			ACTOR0		= (1 << 0),
			ACTOR1		= (1 << 1),
			ACTOR2		= (1 << 2),
			ACTOR5		= (1 << 5)
		};
	};

	///An example class showing the use of springs (distance joints).
	class Trampoline
	{
		vector<DistanceJoint*> springs;
		Box *bottom, *top;

	public:
		Trampoline(const PxVec3& dimensions=PxVec3(1.f,1.f,1.f), PxReal stiffness=1.f, PxReal damping=1.f)
		{
			PxReal thickness = .1f;
			bottom = new Box(PxTransform(PxVec3(0.f,thickness,0.f)),PxVec3(dimensions.x,thickness,dimensions.z));
			top = new Box(PxTransform(PxVec3(0.f,dimensions.y+thickness,0.f)),PxVec3(dimensions.x,thickness,dimensions.z));
			springs.resize(4);
			springs[0] = new DistanceJoint(bottom, PxTransform(PxVec3(dimensions.x,thickness,dimensions.z)), top, PxTransform(PxVec3(dimensions.x,-dimensions.y,dimensions.z)));
			springs[1] = new DistanceJoint(bottom, PxTransform(PxVec3(dimensions.x,thickness,-dimensions.z)), top, PxTransform(PxVec3(dimensions.x,-dimensions.y,-dimensions.z)));
			springs[2] = new DistanceJoint(bottom, PxTransform(PxVec3(-dimensions.x,thickness,dimensions.z)), top, PxTransform(PxVec3(-dimensions.x,-dimensions.y,dimensions.z)));
			springs[3] = new DistanceJoint(bottom, PxTransform(PxVec3(-dimensions.x,thickness,-dimensions.z)), top, PxTransform(PxVec3(-dimensions.x,-dimensions.y,-dimensions.z)));

			for (unsigned int i = 0; i < springs.size(); i++)
			{
				springs[i]->Stiffness(stiffness);
				springs[i]->Damping(damping);
			}
		}

		void AddToScene(Scene* scene)
		{
			scene->Add(bottom);
			scene->Add(top);
		}

		~Trampoline()
		{
			for (unsigned int i = 0; i < springs.size(); i++)
				delete springs[i];
		}
	};

	///A customised collision class, implementing various callbacks
	class MySimulationEventCallback : public PxSimulationEventCallback
	{
	public:
		bool trigger;
		float velocity = 40.0f;
		int score = 0;

		MySimulationEventCallback() : trigger(false) {}

		///Method called when the contact with the trigger object is detected.
		virtual void onTrigger(PxTriggerPair* pairs, PxU32 count) 
		{
			for (PxU32 i = 0; i < count; i++)
			{
				if (pairs[i].otherShape->getGeometryType() != PxGeometryType::ePLANE)
				{
					if (pairs[i].status & PxPairFlag::eNOTIFY_TOUCH_FOUND)
					{
						cerr << "onTrigger::eNOTIFY_TOUCH_FOUND" << endl;
						trigger = true;
						
					}
					if (pairs[i].status & PxPairFlag::eNOTIFY_TOUCH_LOST)
					{
						cerr << "onTrigger::eNOTIFY_TOUCH_LOST" << endl;
						trigger = false;
					}
				}
			}
		}

		bool collisionCheck;

		///Method called when the contact by the filter shader is detected.
		virtual void onContact(const PxContactPairHeader &pairHeader, const PxContactPair *pairs, PxU32 nbPairs) 
		{
			cerr << "Contact found between " << pairHeader.actors[0]->getName() << " " << pairHeader.actors[1]->getName() << endl;

			for (PxU32 i = 0; i < nbPairs; i++) //Check all pairs
			{
				if (pairs[i].events & PxPairFlag::eNOTIFY_TOUCH_FOUND) //Check eNOTIFY_TOUCH_FOUND
				{
					cerr << "onContact::eNOTIFY_TOUCH_FOUND" << endl;
					collisionCheck = true;
					score++;
					std::cout << score << std::endl;
				}

				if (pairs[i].events & PxPairFlag::eNOTIFY_TOUCH_LOST) //Check eNOTIFY_TOUCH_LOST
				{
					cerr << "onContact::eNOTIFY_TOUCH_LOST" << endl;
					collisionCheck = false;
				}
			}
		}

		virtual void onConstraintBreak(PxConstraintInfo *constraints, PxU32 count) {}
		virtual void onWake(PxActor **actors, PxU32 count) {}
		virtual void onSleep(PxActor **actors, PxU32 count) {}
	};

	static PxFilterFlags CustomFilterShader( PxFilterObjectAttributes attributes0,	PxFilterData filterData0,
		PxFilterObjectAttributes attributes1,	PxFilterData filterData1,
		PxPairFlags& pairFlags,	const void* constantBlock,	PxU32 constantBlockSize) //A simple filter shader based on PxDefaultSimulationFilterShader - without group filtering
	{
		if(PxFilterObjectIsTrigger(attributes0) || PxFilterObjectIsTrigger(attributes1)) //Let triggers through
		{
			pairFlags = PxPairFlag::eTRIGGER_DEFAULT;
			return PxFilterFlags();
		}

		pairFlags = PxPairFlag::eCONTACT_DEFAULT;
		
		if((filterData0.word0 & filterData1.word1) && (filterData1.word0 & filterData0.word1))
		{
			pairFlags |= PxPairFlag::eNOTIFY_TOUCH_FOUND;
			pairFlags |= PxPairFlag::eNOTIFY_TOUCH_LOST;
		}

		return PxFilterFlags();
	};

	///Custom scene class
	class MyScene : public Scene
	{
		///Definitions
		Box* box2;
		dSixJoint* paddleJoint, *ballJoint;
		Fans* fan_l, *fan_r;
		MySimulationEventCallback* my_callback;
		Paddle* paddle;
		Plane* plane;
		PxMaterial* bouncyMaterial, *frictionMaterial;
		SideWalls* sideWalls;
		Sphere* ball;
		TopWall* topWall;
		float callVel;
		
	public:
		int score = 0;

		MyScene() : Scene() 
		{
			filter_shader = CustomFilterShader;

		};
		///A custom scene class
		void SetVisualisation()
		{
			px_scene->setVisualizationParameter(PxVisualizationParameter::eSCALE, 1.0f);
			px_scene->setVisualizationParameter(PxVisualizationParameter::eCOLLISION_SHAPES, 1.0f);
		}

		///Custom scene initialisation
		virtual void CustomInit() 
		{
			SetVisualisation();			

			GetMaterial()->setDynamicFriction(.2f);
			
			///Initialise and set the customised event callback
			my_callback = new MySimulationEventCallback();
			px_scene->setSimulationEventCallback(my_callback);

			callVel = my_callback->velocity;

			///Plane information
			plane = new Plane();
			plane->Color(PxVec3(210.f / 255.f, 210.f / 255.f, 210.f / 255.f));
			Add(plane);

			///Material properties
			bouncyMaterial = CreateMaterial(0.0f, 0.0f, 1.0f);
			frictionMaterial = CreateMaterial(0.0f, 3.0f, 0.0f);

			///Wall information
			sideWalls = new SideWalls(); //Creats new instance
			sideWalls->Color(PxVec3(0.0f / 255.0f, 250.0f / 255.0f, 140.0f / 255.0f)); //Sets the colour
			sideWalls->Material(bouncyMaterial); //Adds the material
			sideWalls->Name("Side Wall"); //Names the information (more for debugging)
			Add(sideWalls); //Adds object to the scene

			topWall = new TopWall(PxTransform(PxVec3(0.0f, 2.5f, -65.0f)));
			topWall->Color(PxVec3(0.0f / 255.0f, 250.0f / 255.0f, 140.0f / 255.0f));
			topWall->SetupFiltering(FilterGroup::ACTOR1, FilterGroup::ACTOR2); //Defines collisions between objects
			topWall->Name("Top Wall");
			Add(topWall);
			
			///Ball information
			ball = new Sphere(PxTransform(PxVec3(0.0f, 1.0f, -35.0f)));
			ball->Color(PxVec3(120.0f / 255.0f, 50.0f / 255.0f, 235.0f / 255.0f));
			ball->Material(bouncyMaterial);
			//D6 joint to limit object movement on certain axis
			ballJoint = new dSixJoint(NULL, PxTransform(0.0f, 0.0f, 0.0f), ball, PxTransform(0.0f, 3.0f, -35.0f));
			ballJoint->setMotion(PxD6Axis::eX, PxD6Motion::eFREE);
			ballJoint->setMotion(PxD6Axis::eY, PxD6Motion::eLIMITED);
			ballJoint->setMotion(PxD6Axis::eZ, PxD6Motion::eFREE);
			ballJoint->setMotion(PxD6Axis::eSWING1, PxD6Motion::eFREE);
			ballJoint->setMotion(PxD6Axis::eSWING2, PxD6Motion::eFREE);
			ballJoint->setMotion(PxD6Axis::eTWIST, PxD6Motion::eFREE);
			ball->SetupFiltering(FilterGroup::ACTOR2, FilterGroup::ACTOR1 | FilterGroup::ACTOR5);
			ball->Name("Puck");
			Add(ball);
			
			///Decorative fans
			fan_l = new Fans(PxTransform(PxVec3(-60.0f, 2.5f, -65.0f)));
			fan_l->Color(PxVec3(76.0f / 255.0f, 0.0f / 255.0f, 153.0f / 255.0f), 0);
			fan_l->Color(PxVec3(204.0f / 255.0f, 204.0f / 255.0f, 0.0f / 255.0f), 1);
			RevoluteJoint* motorJoint_l = new RevoluteJoint(NULL, PxTransform(PxVec3(-40.0f, 10.0f, -75.0f), PxQuat(PxPi / 2, PxVec3(0.0f, 0.0f, 1.0f))), fan_l, PxTransform(PxVec3(0.0f, 0.0f, 0.0f), PxQuat(PxPi / 2, PxVec3(0.0f, 0.0f, 1.0f))));
			motorJoint_l->DriveVelocity(PxReal(-1));
			fan_l->Name("Left Fan");
			Add(fan_l);

			fan_r = new Fans(PxTransform(PxVec3(-60.0f, 2.5f, -65.0f)));
			fan_r->Color(PxVec3(76.0f / 255.0f, 0.0f / 255.0f, 153.0f / 255.0f), 0);
			fan_r->Color(PxVec3(204.0f / 255.0f, 204.0f / 255.0f, 0.0f / 255.0f), 1);
			RevoluteJoint* motorJoint_r = new RevoluteJoint(NULL, PxTransform(PxVec3(40.0f, 10.0f, -75.0f), PxQuat(PxPi / 2, PxVec3(0.0f, 0.0f, 1.0f))), fan_r, PxTransform(PxVec3(0.0f, 0.0f, 0.0f), PxQuat(PxPi / 2, PxVec3(0.0f, 0.0f, 1.0f))));
			motorJoint_r->DriveVelocity(PxReal(1));
			fan_r->Name("Right Fan");
			Add(fan_r);

			///Paddle information
			paddle = new Paddle(PxTransform(PxVec3(0.0f, 3.0f, -15.0f)));
			paddle->Color(PxVec3(200.0f / 255.0f, 180.0f / 255.0f, 50.0f / 255.0f));
			paddle->Material(frictionMaterial);
			paddleJoint = new dSixJoint(NULL, PxTransform(0.0f, 0.0f, 0.0f), paddle, PxTransform(0.0f, 3.0f, -15.0f));
			paddleJoint->setMotion(PxD6Axis::eX, PxD6Motion::eFREE);
			paddleJoint->setMotion(PxD6Axis::eY, PxD6Motion::eLIMITED);
			paddleJoint->setMotion(PxD6Axis::eZ, PxD6Motion::eFREE);
			paddleJoint->setMotion(PxD6Axis::eSWING1, PxD6Motion::eLOCKED);
			paddleJoint->setMotion(PxD6Axis::eSWING2, PxD6Motion::eLOCKED);
			paddleJoint->setMotion(PxD6Axis::eTWIST, PxD6Motion::eLOCKED); 
			paddle->SetupFiltering(FilterGroup::ACTOR5, FilterGroup::ACTOR2);
			paddle->Name("Player Paddle");
			Add(paddle);
		}
		
		///Custom udpate function
		virtual void CustomUpdate() 
		{
			score = my_callback->score;
			if (my_callback->collisionCheck)
			{
				callVel = -callVel; //Inverses velocity, depending on which objects collide
				my_callback->collisionCheck = false;
			}
			
			((PxRigidBody*)ball->Get())->addForce(PxVec3(0.0f, 0.0f, callVel) * 20);
		}

		/// An example use of key release handling
		void ExampleKeyReleaseHandler()
		{
			cerr << "I am released!" << endl;
		}

		/// An example use of key presse handling
		void ExampleKeyPressHandler()
		{
			cerr << "I am pressed!" << endl;
		}
	};
}
