Extension { #name : 'String' }

{ #category : '*VM-Plugins-Primitives' }
String >> linesIncludeEmptySubstrings: shouldInclude [

	^ self strtok: self class crlf inclusive: shouldInclude
]

{ #category : '*VM-Plugins-Primitives' }
String >> strtok: delimiters inclusive: boolean [

	
	<primitive: 'primitive_strtok_r' module: 'UtilsPlugin'>
	self primitiveFail
]
