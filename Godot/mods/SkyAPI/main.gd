# SkyAPI | An API to allow mod developers to make their own skyboxes!
# Made by IamKikin | 2024

extends Node
var prefix = "[SkyAPI] "

# Runs when the game starts
func _ready():
	print(prefix + "Running!")

# Registers a new Gradient Sky ( Requires 4 Colors: Top, TopHorizon, Bottom, BottomHorizon )
# Also requires a float ( SkyCurve )
func add_gradient_sky(TopColor : Color, TopHorizonColor : Color, BottomColor : Color, BottomHorizonColor : Color, SkyCurve : float):
	# Get WorldEnv
	var map_env = get_node_or_null("/root/world/Viewport/main/map/main_map/WorldEnvironment")
	
	# Create the skybox
	var sky = ProceduralSky.new()
	
	# Set Colors
	sky.sky_top_color = TopColor
	sky.sky_horizon_color = TopHorizonColor
	
	sky.ground_bottom_color = BottomColor
	sky.ground_horizon_color = BottomHorizonColor
	
	# Set Curve
	sky.sky_curve = SkyCurve

	# Finish
	map_env.environment.background_mode = Environment.BG_SKY
	map_env.environment.background_sky = sky
	print(prefix + "Registered a Gradient Sky!")

# Registers a new Image Sky ( Requires an image path, and a custom FOV for the skybox )
func add_image_sky(ImagePath : String, CustomFOV):
	# Get WorldEnv
	var map_env = get_node_or_null("/root/world/Viewport/main/map/main_map/WorldEnvironment")
	
	# Load the skybox
	var skybox = load(ImagePath)
	if skybox:
		# Create a sky
		var sky = PanoramaSky.new()
		# Set the skybox to the image
		sky.panorama = skybox
		
		# Finish & Set Custom FOV
		map_env.environment.background_mode = Environment.BG_SKY
		map_env.environment.background_sky = sky
		map_env.environment.background_sky_custom_fov = CustomFOV
		
		print(prefix + "Registered an Image Sky!")
