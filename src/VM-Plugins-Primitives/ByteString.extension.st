Extension { #name : 'ByteString' }

{ #category : '*VM-Plugins-Primitives' }
ByteString >> asByteArrayPrimitive [

	<primitive: 'primitive_string_to_bytearray' module:
	'CairoGraphicsPlugin'>
	^ self asByteArray
]
