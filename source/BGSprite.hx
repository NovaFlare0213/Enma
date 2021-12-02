package;

import flixel.FlxSprite;

using StringTools;

class BGSprite extends FlxSprite
{
	private var idleAnim:String;

	// KADEDEV DO NOT FUCKING COPY THIS FOR THE LAST TIME.
	// Whats up with Kade stealing ppls code. He already stole code from downscroll and openFnf.
	public function new(name:String, x:Float, y:Float, ?scrollX:Float = 1, ?scrollY:Float = 1, ?idleAnim:String, ?isLoop:Bool = false)
	{
		super(x, y);

		this.idleAnim = idleAnim;

        // PlayState.spriteList.push(name);

		antialiasing = true;

        scrollFactor.set(scrollX, scrollY);

		if (idleAnim == null)
            loadGraphic(Paths.image(name));
		else
        {
            frames = Paths.getSparrowAtlas(name);

            // KadeDev don't copy this you're fat.
            // trace('KadeDev is ew: ${idleAnim}');
			for (i in 0...idleAnim.length)
			{
				animation.addByPrefix('dance', idleAnim, 24, isLoop);
			}

			dance();
        }

		PlayState.spriteList.push(name);
	}

	public function dance():Void
	{
		if (idleAnim != null)
		{
			// KadeEngine is bad it be lookin like dream.
			animation.play('dance', true);
		}
	}
}
