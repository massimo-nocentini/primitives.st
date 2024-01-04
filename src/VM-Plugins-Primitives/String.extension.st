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
String >> fixEmptyLinesForPango [

	^ self fixEmptyLinesForPango: Character cr
]

{ #category : '*VM-Plugins-Primitives' }
String >> fixEmptyLinesForPango: splitter [

	<primitive: 'primitive_fix_empty_lines_for_pango' module:
	'CairoGraphicsPlugin'>
	| ending separator |
	self halt.
	ending := Character cr.
	separator := Character space.

	^ self class streamContents: [ :stream |
		  self first = ending ifTrue: [ stream << separator ].

		  1 to: self size - 1 do: [ :i |
			  | each |
			  each := self at: i.
			  stream nextPut: each.
			  (each = ending and: [ (self at: i + 1) = ending ]) ifTrue: [
				  stream nextPut: separator ] ].

		  stream nextPut: self last.

		  self last = ending ifTrue: [ stream << separator ] ]
]

{ #category : '*VM-Plugins-Primitives' }
String >> gMarkupEscapeText [
	"https://docs.gtk.org/glib/func.markup_escape_text.html"

	<primitive: 'primitive_g_markup_escape_text' module:
	'CairoGraphicsPlugin'>
	self primitiveFail
]

{ #category : '*VM-Plugins-Primitives' }
String >> linesIncludeEmptySubstrings: shouldInclude [

	^ self strtok: self class crlf inclusive: shouldInclude
]

{ #category : '*VM-Plugins-Primitives' }
String >> replaceAllTabsWithSpaces: times [

	<primitive: 'primitive_replace_tabs_with_spaces' module:
	'CairoGraphicsPlugin'>
	self
		copyReplaceAll: self class tab
		with: (self class space repeat: times)
]

{ #category : '*VM-Plugins-Primitives' }
String >> replaceAllTabsWithThreeSpaces [

	^ self replaceAllTabsWithSpaces: 3
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
