Extension { #name : 'String' }

{ #category : '*VM-Plugins-Primitives' }
String >> asUTF8ByteArray [

	^ self asUTF8ByteArray: false
]

{ #category : '*VM-Plugins-Primitives' }
String >> asUTF8ByteArray: include [

	^ self utf8WithTrailingZero: include asByteArray: true
]

{ #category : '*VM-Plugins-Primitives' }
String >> asUTF8String [

	^ self utf8WithTrailingZero: false asByteArray: false
]

{ #category : '*VM-Plugins-Primitives' }
String >> linesIncludeEmptySubstrings: shouldInclude [

	^ self strtok: self class crlf inclusive: shouldInclude
]

{ #category : '*VM-Plugins-Primitives' }
String >> strtok: delimiters inclusive: boolean [

	
	<primitive: 'primitive_strtok_r' module: 'UtilsPlugin'>
	self primitiveFail
]

{ #category : '*VM-Plugins-Primitives' }
String >> utf8WithTrailingZero: include asByteArray: aClass [

	<primitive: 'primitive_string_to_utf8' module: 'CairoGraphicsPlugin'>
	self primitiveFail
]
