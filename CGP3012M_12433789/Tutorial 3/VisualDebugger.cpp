#include "VisualDebugger.h"
#include <vector>
#include "Extras\Camera.h"
#include "Extras\Renderer.h"
#include "Extras\HUD.h"

namespace VisualDebugger
{
	using namespace physx;

	enum RenderMode
	{
		DEBUG,
		NORMAL,
		BOTH
	};

	enum HUDState
	{
		EMPTY = 0,
		HELP = 1,
		PAUSE = 2,
		SCORE = 3
	};

	//function declarations
	void KeyHold();
	void KeySpecial(int key, int x, int y);
	void KeyRelease(unsigned char key, int x, int y);
	void KeyPress(unsigned char key, int x, int y);

	void motionCallback(int x, int y);
	void mouseCallback(int button, int state, int x, int y);
	void exitCallback(void);

	void RenderScene();
	void ToggleRenderMode();
	void HUDInit();

	///simulation objects
	Camera* camera;
	PhysicsEngine::MyScene* scene;
	PxReal delta_time = 1.f/60.f;
	PxReal gForceStrength = 1000;
	RenderMode render_mode = NORMAL;
	const int MAX_KEYS = 256;
	bool key_state[MAX_KEYS];
	bool hud_show = true;
	HUD hud;
	PxRigidDynamic* paddle;
	int score;

	//Init the debugger
	void Init(const char *window_name, int width, int height)
	{
		///Init PhysX
		PhysicsEngine::PxInit();
		scene = new PhysicsEngine::MyScene();
		scene->Init();

		///Init renderer
		Renderer::BackgroundColor(PxVec3(150.f / 255.f, 150.f / 255.f, 150.f / 255.f));
		Renderer::SetRenderDetail(40);
		Renderer::InitWindow(window_name, width, height);
		Renderer::Init();

		camera = new Camera(PxVec3(0.0f, 100.0f, -20.0f), PxVec3(0.f, -1.0f, -0.1f), 25.f);

		//initialise HUD
		HUDInit();

		///Assign callbacks
		//render
		glutDisplayFunc(RenderScene);

		//keyboard
		glutKeyboardFunc(KeyPress);
		glutSpecialFunc(KeySpecial);
		glutKeyboardUpFunc(KeyRelease);

		//mouse
		glutMouseFunc(mouseCallback);
		glutMotionFunc(motionCallback);

		//exit
		atexit(exitCallback);

		//init motion callback
		motionCallback(0,0);
	}

	void HUDInit()
	{
		//Adds an empty screen
		hud.AddLine(EMPTY, "");
		hud.Clear();

		///Debug keys
		/*hud.AddLine(HELP, " Simulation");
		hud.AddLine(HELP, "    F9 - select next actor");
		hud.AddLine(HELP, "    F10 - pause");
		hud.AddLine(HELP, "    F12 - reset");
		hud.AddLine(HELP, "");
		hud.AddLine(HELP, " Display");
		hud.AddLine(HELP, "    F5 - help on/off");
		hud.AddLine(HELP, "    F6 - shadows on/off");
		hud.AddLine(HELP, "    F7 - render mode");
		hud.AddLine(HELP, "");
		hud.AddLine(HELP, " Camera");
		hud.AddLine(HELP, "    mouse + click - change orientation");
		hud.AddLine(HELP, "    F8 - reset view");
		hud.AddLine(HELP, "");
		hud.AddLine(HELP, " Force (applied to the selected actor)");
		hud.AddLine(HELP, "    I,K,J,L,U,M - forward,backward,left,right,up,down");*/

		///Pause screen
		string textForScore = std::to_string(score);
		hud.AddLine(SCORE, "                                                                    Puck Relay\n\n                                                             Movement - Arrow Keys\n                                                                 Press P to Pause\n                                                                 Press R to Reset\n                                                                      Score: " + textForScore);
		hud.AddLine(PAUSE, "");
		hud.AddLine(PAUSE, "");
		hud.AddLine(PAUSE, "");
		hud.AddLine(PAUSE, "   Game paused. Press P to continue.");
		hud.FontSize(0.018f); //Sets font
		hud.Color(PxVec3(0.f,0.f,0.f)); //Sets font colour
	}

	///Main game loop
	void Start()
	{ 
		glutMainLoop(); 
	}

	void updateScore()
	{
		score = scene->score;
	}

	///Render the scene and perform a single simulation step
	void RenderScene()
	{
		///Handles keyboard input
		KeyHold();
		updateScore();

		///Starts rendering
		Renderer::Start(camera->getEye(), camera->getDir());

		if ((render_mode == DEBUG) || (render_mode == BOTH))
		{
			Renderer::Render(scene->Get()->getRenderBuffer());
		}

		if ((render_mode == NORMAL) || (render_mode == BOTH))
		{
			std::vector<PxActor*> actors = scene->GetAllActors();
			if (actors.size())
				Renderer::Render(&actors[0], (PxU32)actors.size());
		}

		///Adjust the HUD state
		if (hud_show)
		{
			if (scene->Pause())
				hud.ActiveScreen(PAUSE);
			else
				hud.ActiveScreen(SCORE);
		}
		else
			hud.ActiveScreen(EMPTY);

		HUDInit();
		
		hud.Render();//Render HUD
		Renderer::Finish();

		paddle = scene->GetPaddleActor(); //Retrieves paddle information

		///Perform a single simulation step
		scene->Update(delta_time);
	}

	///User defined keyboard handlers
	void UserKeyPress(int key)
	{
		switch (toupper(key))
		{
		case 'R':
			scene->ExampleKeyPressHandler();
			break;
		default:
			break;
		}
	}

	void UserKeyRelease(int key)
	{
		switch (toupper(key))
		{
		case 'R':
			scene->ExampleKeyReleaseHandler();
			break;
		default:
			break;
		}
	}

	void UserKeyHold(int key)
	{
	}

	///Camera control
	void CameraInput(int key)
	{
		switch (toupper(key))
		{
		case 'W':
			camera->MoveForward(delta_time);
			break;
		case 'S':
			camera->MoveBackward(delta_time);
			break;
		case 'A':
			camera->MoveLeft(delta_time);
			break;
		case 'D':
			camera->MoveRight(delta_time);
			break;
		case 'Q':
			camera->MoveUp(delta_time);
			break;
		case 'Z':
			camera->MoveDown(delta_time);
			break;
		default:
			break;
		}
	}

	///Force control 
	void ForceInput(int key)
	{
		if (!scene->GetSelectedActor())
			return;

		switch (toupper(key))
		{
			///Force controls on the selected actor
		case 'I': //Forward
			scene->GetSelectedActor()->addForce(PxVec3(0,0,-1)*gForceStrength);
			break;
		case 'K': //Backward
			scene->GetSelectedActor()->addForce(PxVec3(0,0,1)*gForceStrength);
			break;
		case 'J': //Left
			scene->GetSelectedActor()->addForce(PxVec3(-1,0,0)*gForceStrength);
			break;
		case 'L': //Right
			scene->GetSelectedActor()->addForce(PxVec3(1,0,0)*gForceStrength);
			break;
		case 'U': //Up
			scene->GetSelectedActor()->addForce(PxVec3(0,1,0)*gForceStrength);
			break;
		case 'M': //Down
			scene->GetSelectedActor()->addForce(PxVec3(0,-1,0)*gForceStrength);
			break;
		case 'P': //Pause
			scene->Pause(!scene->Pause());
			break;
		case 'R': //Reset
			scene->Reset();
			break;
		case ' ': //Add downward velocity to ball
			scene->GetSelectedActor()->setLinearVelocity(PxVec3(0, 0, 1) * 5);
		default:
			break;
		}
	}

	void KeySpecial(int key, int x, int y)
	{
		switch (key)
		{
			///Debug controls
		case GLUT_KEY_F5: //HUD on/off
			hud_show = !hud_show;
			break;
		case GLUT_KEY_F6: //Shadows on/off
			Renderer::ShowShadows(!Renderer::ShowShadows());
			break;
		case GLUT_KEY_F7: //Toggle render mode
			ToggleRenderMode();
			break;
		case GLUT_KEY_F8: //Reset camera view
			camera->Reset();
			break;
		case GLUT_KEY_F9: //Select next actor
			scene->SelectNextActor();
			break;
			///Paddle movement
		case GLUT_KEY_RIGHT:
			paddle->setLinearVelocity(PxVec3(1.0f, 0.0f, 0.0f) * 20);
			break;
		case GLUT_KEY_LEFT:
			paddle->setLinearVelocity(PxVec3(-1.0f, 0.0f, 0.0f) * 20);
			break;
		case GLUT_KEY_UP:
			paddle->setLinearVelocity(PxVec3(0.0f, 0.0f, -1.0f) * 20);
			break;
		case GLUT_KEY_DOWN:
			paddle->setLinearVelocity(PxVec3(0.0f, 0.0f, 1.0f) * 20);
			break;
		default:
			break;
		}
	}

	///Handle single key presses
	void KeyPress(unsigned char key, int x, int y)
	{
		if (key_state[key] == true) //Do it only once
			return;

		key_state[key] = true;

		if (key == 27) //Exit
			exit(0);

		UserKeyPress(key);
	}

	void KeyRelease(unsigned char key, int x, int y) //Handle key release

	{
		key_state[key] = false;
		UserKeyRelease(key);
	}

	///Handle held keys
	void KeyHold()
	{
		for (int i = 0; i < MAX_KEYS; i++)
		{
			if (key_state[i])
			{
				CameraInput(i);
				ForceInput(i);
				UserKeyHold(i);
			}
		}
	}

	///Mouse handling
	int mMouseX = 0;
	int mMouseY = 0;

	void motionCallback(int x, int y)
	{
		int dx = mMouseX - x;
		int dy = mMouseY - y;

		mMouseX = x;
		mMouseY = y;
	}

	void mouseCallback(int button, int state, int x, int y)
	{
		mMouseX = x;
		mMouseY = y;
	}

	void ToggleRenderMode()
	{
		if (render_mode == NORMAL)
			render_mode = DEBUG;
		else if (render_mode == DEBUG)
			render_mode = BOTH;
		else if (render_mode == BOTH)
			render_mode = NORMAL;
	}

	///Exit callback
	void exitCallback(void)
	{
		delete camera;
		delete scene;
		PhysicsEngine::PxRelease();
	}
}

