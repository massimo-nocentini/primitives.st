Extension { #name : 'Character' }

{ #category : '*VM-Plugins-Primitives' }
Character >> asUTF8ByteArray [

	^ self asUTF8ByteArray: false
]

{ #category : '*VM-Plugins-Primitives' }
Character >> asUTF8ByteArray: include [

	<primitive: 'primitive_g_unichar_to_utf8' module:
	'CairoGraphicsPlugin'>
	self primitiveFail
]
