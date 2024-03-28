Extension { #name : 'Float' }

{ #category : '*VM-Plugins-Primitives' }
Float >> primitiveTimes: x plus: y [

	<primitive: 'primitive_fma' module: 'UtilsPlugin'>
	^ super times: x plus: y
]

{ #category : '*VM-Plugins-Primitives' }
Float >> times: x plus: y [

	^ self primitiveTimes: x asFloat plus: y asFloat
]
