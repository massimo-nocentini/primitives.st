"
# TCairoGraphicsPlugin

I am a trait that provides methods supported by primitive C functions available in the VM.
"
Trait {
	#name : 'TCairoGraphicsPlugin',
	#category : 'VM-Plugins-Primitives',
	#package : 'VM-Plugins-Primitives'
}

{ #category : 'primitives' }
TCairoGraphicsPlugin >> g_object_unref: handler [

	<primitive: 'primitive_g_object_unref' module: 'CairoGraphicsPlugin'>
	self primitiveFail
]
