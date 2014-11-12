package sentinel.b2
{
	
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2BodyDef;
	import Box2D.Dynamics.b2Fixture;
	import Box2D.Dynamics.b2FixtureDef;
	import Box2D.Dynamics.b2World;
	import sentinel.contracts.IDeconstructs;
	import starling.events.EventDispatcher;
	import sentinel.base.Thing;
	
	
	public class B2Body extends EventDispatcher implements IDeconstructs
	{
		
		public static const STATIC:int = b2Body.b2_staticBody;
		public static const DYNAMIC:int = b2Body.b2_dynamicBody;
		public static const KINEMATIC:int = b2Body.b2_kinematicBody;
		
		
		private var _base:b2Body;
		private var _world:B2World;
		private var _def:b2BodyDef;
		private var _data:B2BodyData;
		private var _position:B2Vector2D;
		private var _fixtures:Vector.<B2Fixture>;
		private var _linearVelocity:B2Vector2D;
		private var _internalForce:B2Vector2D;
		
		
		/**
		 * Internal - Use <code>B2World.createBody()</code>.
		 */
		public function B2Body(world:B2World, body:b2Body, def:b2BodyDef)
		{
			_base = body;
			_def = def;
			_world = world;
			_data = new B2BodyData(this);
			_position = new B2Vector2D();
			_fixtures = new <B2Fixture>[];
			_linearVelocity = new B2Vector2D();
			_internalForce = new B2Vector2D();
			
			_base.SetUserData(_data);
		}
		
		
		public function deconstruct():void
		{
			if (_world !== null)
			{
				destroy();
			}
			
			destroyAllFixtures();
			removeEventListeners();
			
			// TODO: More?
			// ...
		}
		
		
		public function destroy():void
		{
			if (_world !== null)
			{
				_world.__destroyBody(this);
				_world = null;
				
				deconstruct();
			}
		}
		
		
		public function createFixture(shape:IB2Shape, fixtureDef:B2FixtureDef = null):B2Fixture
		{
			var nativeFixtureDef:b2FixtureDef = new b2FixtureDef();
			nativeFixtureDef.shape = shape.base;
			
			if(fixtureDef !== null)
			{
				nativeFixtureDef.density = fixtureDef.density;
				nativeFixtureDef.friction = fixtureDef.friction;
				nativeFixtureDef.restitution = fixtureDef.restitution;
			}
			
			var nativeFixture:b2Fixture = _base.CreateFixture(nativeFixtureDef);
			var fixture:B2Fixture = new B2Fixture(nativeFixture);
			
			_fixtures.push(fixture);
			
			
			return fixture;
		}
		
		
		public function destroyFixture(fixture:B2Fixture):void
		{
			var i:int = _fixtures.indexOf(fixture);
			
			if(i >= 0)
			{
				_fixtures.splice(i, 1);
				_base.DestroyFixture(fixture.base);
			}
		}
		
		
		public function destroyAllFixtures():void
		{
			while(_fixtures.length > 0)
			{
				var f:B2Fixture = _fixtures.pop();
				_base.DestroyFixture(f.base);
			}
		}
		
		
		public function get base():b2Body { return _base; }
		public function get world():B2World { return _world; }
		public function get fixtures():Vector.<B2Fixture> { return _fixtures; }
		public function get numFixtures():int { return _fixtures.length; }
		
		public function get awake():Boolean{ return _base.IsAwake(); }
		public function set awake(value:Boolean):void{ _base.SetAwake(value); }
		
		public function get isBullet():Boolean{ return _base.IsBullet(); }
		public function set isBullet(value:Boolean):void{ _base.SetBullet(value); }
		
		public function get rotation():Number{ return _base.GetAngle(); }
		public function set rotation(value:Number):void{ _base.SetAngle(value); }
		
		public function get fixedRotation():Boolean{ return _base.IsFixedRotation(); }
		public function set fixedRotation(value:Boolean):void{ _base.SetFixedRotation(value); }
		
		public function get angularDamping():Number{ return _base.GetAngularDamping(); }
		public function set angularDamping(value:Number):void{ _base.SetAngularDamping(value); }
		
		public function get linearDamping():Number{ return _base.GetLinearDamping(); }
		public function set linearDamping(value:Number):void{ _base.SetLinearDamping(value); }
		
		public function get linearVelocity():B2Vector2D{ return _linearVelocity; }
		public function set linearVelocity(value:B2Vector2D):void { _linearVelocity = value; }
		
		public function get owner():Thing{ return _data.owner }
		public function set owner(value:Thing):void { _data.owner = value; }
		
		
		public function get angularVelocity():Number{ return _base.GetAngularVelocity(); }
		
		public function set angularVelocity(value:Number):void
		{
			_base.SetAngularVelocity(value);
			_base.SetAwake(true);
		}
		
		
		public function get linearVelocityX():Number{ return _base.GetLinearVelocity().x * B2World.scale; }
		
		public function set linearVelocityX(value:Number):void
		{
			_linearVelocity.x = value;
			_linearVelocity.y = _base.GetLinearVelocity().y * B2World.scale;
			_base.SetLinearVelocity(_linearVelocity.base);
			_base.SetAwake(true);
		}
		
		public function get linearVelocityY():Number{ return _base.GetLinearVelocity().y * B2World.scale; }
		
		public function set linearVelocityY(value:Number):void
		{
			_linearVelocity.y = value;
			_linearVelocity.x = _base.GetLinearVelocity().x * B2World.scale;
			_base.SetLinearVelocity(_linearVelocity.base);
			_base.SetAwake(true);
		}
		
		
		public function get x():Number{ return _base.GetPosition().x * B2World.scale; }
		
		public function set x(value:Number):void
		{
			_position.x = value;
			_position.y = _base.GetPosition().y * B2World.scale;
			_base.SetPosition(_position.base);
		}
		
		
		public function get y():Number{ return _base.GetPosition().y * B2World.scale; }
		
		public function set y(value:Number):void
		{
			_position.y = value;
			_position.x = _base.GetPosition().x * B2World.scale;
			_base.SetPosition(_position.base);
		}
		
	}
	
}