package sentinel.framework
{
	
	import flash.media.Sound;
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
		
		public static const AUDIO:String = 'audio';
		public static const TEXTURE:String = 'texture';
		public static const SHEET:String = 'sheet';
		
		
		private var _assets:Object = { };
		
		
		public function registerAssets(assets:Object):void
		{
			for (var assetName:String in assets)
			{
				if ((assets[assetName] is ILibraryAsset))
				{
					var asset:ILibraryAsset = assets[assetName] as ILibraryAsset;
					
					if (!_has(asset.assetType, assetName))
					{
						if (!_assets.hasOwnProperty(asset.assetType)) _assets[asset.assetType] = { };
						_assets[asset.assetType][assetName] = asset;
					}
					else
					{
						throw FrameworkError.compile('Library asset {{ name }} of type {{ type }} already exists.', {
							name: assetName,
							type: asset.assetType
						});
					}
				}
				else
				{
					throw FrameworkError.compile('The object provided to Library.registerAssets() can only contain ILibraryAssets.');
				}
			}
		}
		
		
		private function _has(type:String, name:String):Boolean
		{
			return _assets.hasOwnProperty(type) && _assets[type].hasOwnProperty(name);
		}
		
		
		private function _find(type:String, name:String):ILibraryAsset
		{
			if (_has(type, name))
			{
				return _assets[type][name];
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
			return _find(TEXTURE, name) as Texture;
		}
		
		
		public function getTextureFromSheet(sheetName:String, regionName:String):Texture
		{
			return getSheet(sheetName).getTexture(regionName);
		}
		
		
		public function getSheet(name:String):Sheet
		{
			return _find(SHEET, name) as Sheet;
		}
		
		
		public function getImage(textureName:String):Image
		{
			return new Image(getTexture(textureName));
		}
		
		
		public function getImageFromSheet(sheetName:String, regionName:String):Image
		{
			return new Image(getTextureFromSheet(sheetName, regionName));
		}
		
		
		public function getAudio(name:String):sentinel.framework.audio.Sound
		{
			return new sentinel.framework.audio.Sound(_find(AUDIO, name) as flash.media.Sound);
		}
		
		
		public override function get name():String { return 'library'; }
		
	}
	
}