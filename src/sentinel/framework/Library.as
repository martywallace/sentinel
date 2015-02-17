package sentinel.framework
{
	
	import sentinel.framework.audio.Sound;
	import sentinel.framework.errors.FrameworkError;
	import sentinel.framework.graphics.Image;
	import sentinel.framework.graphics.Sheet;
	import sentinel.framework.graphics.Texture;
	
	
	/**
	 * The Library manages game assets e.g. textures, sprite sheets and sound.
	 * @author Marty Wallace.
	 */
	public class Library extends Service
	{
		
		public static const SOUND:String = 'sound';
		public static const TEXTURE:String = 'texture';
		public static const SHEET:String = 'sheet';
		
		
		private var _assets:Object = { };
		
		
		/**
		 * Registers a collection of library assets for use in your game.
		 * @param assets An object whose keys are the names used to reference the assets via the
		 * Library service later and whose values are instances of ILibraryAsset.
		 */
		public function registerAssets(assets:Object):void
		{
			for (var assetName:String in assets)
			{
				if ((assets[assetName] is ILibraryAsset))
				{
					var asset:ILibraryAsset = assets[assetName] as ILibraryAsset;
					
					if (!has(asset.type, assetName))
					{
						if (!_assets.hasOwnProperty(asset.type)) _assets[asset.type] = { };
						_assets[asset.type][assetName] = asset;
					}
					else
					{
						throw FrameworkError.compile('Library asset {{ name }} of type {{ type }} already exists.', {
							name: assetName,
							type: asset.type
						});
					}
				}
				else
				{
					throw FrameworkError.compile('The object provided to Library.registerAssets() can only contain ILibraryAssets.');
				}
			}
		}
		
		
		/**
		 * Determine whether the Library contains an asset with the specified name and type.
		 * @param type The type of asset, defined by <code>ILibraryAsset.type</code>.
		 * @param name The name assigned to the asset during <code>Library.registerAssets()</code>.
		 */
		public function has(type:String, name:String):Boolean
		{
			return _assets.hasOwnProperty(type) && _assets[type].hasOwnProperty(name);
		}
		
		
		/**
		 * Finds a library assets based on the specified name and type.
		 * @param type The type of asset to find, defined by <code>ILibraryAsset.type</code>.
		 * @param name The name assigned to the asset during <code>Library.registerAssets()</code>.
		 */
		public function find(type:String, name:String):ILibraryAsset
		{
			if (has(type, name))
			{
				return _assets[type][name] as ILibraryAsset;
			}
			else
			{
				throw FrameworkError.compile('The library asset {{ name }} of type {{ type }} does not exist.', {
					name: name,
					type: type
				});
			}
		}
		
		
		public function getTexture(name:String):Texture
		{
			return find(TEXTURE, name) as Texture;
		}
		
		
		public function getTextureFromSheet(sheetName:String, regionName:String):Texture
		{
			return getSheet(sheetName).getTexture(regionName);
		}
		
		
		public function getSheet(name:String):Sheet
		{
			return find(SHEET, name) as Sheet;
		}
		
		
		public function getImage(textureName:String):Image
		{
			return new Image(getTexture(textureName));
		}
		
		
		public function getImageFromSheet(sheetName:String, regionName:String):Image
		{
			return new Image(getTextureFromSheet(sheetName, regionName));
		}
		
		
		public function getSound(name:String):Sound
		{
			return find(SOUND, name) as Sound;
		}
		
		
		public override function get name():String { return 'library'; }
		
	}
	
}