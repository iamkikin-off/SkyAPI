# SkyAPI - IamKikin
Allows mod developers to register their own skyboxes!

# Developer Usage

To use SkyAPI, download SkyAPI from my [Github](https://github.com/iamkikin-off/SkyAPI), then autoload it and create your skyboxes!

```gdscript
onready var skyapi = get_node_or_null("/root/SkyAPI")

func #ANY_FUNC_THAT_LOADS_AFTER_CREATING/JOINING_A_LOBBY():
    # Registers a new Gradient Sky ( Requires 4 Colors: Top, TopHorizon, Bottom, BottomHorizon )
    # Also requires a float ( SkyCurve )

    # Registers a new Image Sky ( Requires an image path, and a custom FOV for the skybox )
    add_gradient_sky(Top, TopHorizon, Bottom, BottomHorizon, SkyCurve)
    add_image_sky(ImagePath, CustomFOV)
```

> Report any bugs to "iamkikin" on Discord! And Image Skyboxes have a weird thing where they rotate around the camera so don't report that to me :3
