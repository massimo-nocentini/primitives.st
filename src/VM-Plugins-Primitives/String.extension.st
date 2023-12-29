Extension { #name : 'String' }

{ #category : '*VM-Plugins-Primitives' }
String >> asUTF8ByteArray [
	"^ self asUTF8ByteArray: true"

	^ ByteArray new: self size * 3 streamContents: [ :s |
		  self do: [ :each | s nextPutAll: (each asUTF8ByteArray: false) ] ]
]

{ #category : '*VM-Plugins-Primitives' }
String >> asUTF8ByteArray: include [

	^ ByteArray streamContents: [ :buffer |
		  | s |
		  s := self size.

		  1 to: s - 1 do: [ :i |
		  buffer nextPutAll: ((self at: i) asUTF8ByteArray: false) ].

		  buffer nextPutAll: ((self at: s) asUTF8ByteArray: include) ]
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
