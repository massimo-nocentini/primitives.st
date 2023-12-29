Extension { #name : 'String' }

{ #category : '*VM-Plugins-Primitives' }
String >> asUTF8ByteArray [

	^ self asUTF8ByteArray: false
]

{ #category : '*VM-Plugins-Primitives' }
String >> asUTF8ByteArray: include [

	<primitive: 'primitive_string_to_utf8' module: 'CairoGraphicsPlugin'>
	self primitiveFail
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
