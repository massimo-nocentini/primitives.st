Class {
	#name : 'UtilsPrimitivesVMPluginTest',
	#superclass : 'TestCase',
	#category : 'VM-Plugins-Primitives-Tests',
	#package : 'VM-Plugins-Primitives-Tests'
}

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testAsUTF8ByteArray_Character [

	self
		assert: 223 asCharacter asUTF8ByteArray equals: #[ 195 159 ];
		assert: $a asUTF8ByteArray equals: #[ 97 ].

	self
		assert: (223 asCharacter asUTF8ByteArray: true)
		equals: #[ 195 159 0 ];
		assert: ($a asUTF8ByteArray: true) equals: #[ 97 0 ]
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testAsUTF8ByteArray_String [

	self assert: '' asUTF8ByteArray equals: #[  ].

	self assert: ('' asUTF8ByteArray: true) equals: #[ 0 ].

	self assert: 'abc' asUTF8ByteArray equals: #[ 97 98 99 ].
	self assert: ('abc' asUTF8ByteArray: true) equals: #[ 97 98 99 0 ].

	self
		assert: 223 asCharacter asString asUTF8ByteArray
		equals: #[ 195 159 ].

	self
		assert: (223 asCharacter asString asUTF8ByteArray: true)
		equals: #[ 195 159 0 ]
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testAsUTF8ByteArray_StringLoremIpsum [

	| lorem |
	lorem := String loremIpsum: 1000.
	self assert: lorem asUTF8ByteArray equals: lorem asUTF8Bytes
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testAsUTF8_ByteArray_String [

	| lorem |
	lorem := String loremIpsum: 1000.
	self
		assert: (lorem utf8WithTrailingZero: false asByteArray: true) asString
		equals: (lorem utf8WithTrailingZero: false asByteArray: false)
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testAsUTF8_String [

	| expected |
	expected := 'abc' utf8WithTrailingZero: true asByteArray: false.

	self
		assert:
		('abc' utf8WithTrailingZero: true asByteArray: true) asString
		equals: expected.

	self
		assert: expected size
		equals: ('abc' , Character null asString) size
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testFixEmptyLinesForPango [

	self assert: '' fixEmptyLinesForPango equals: ''.

	self
		assert: '
' fixEmptyLinesForPango
		equals: (String streamContents: [ :s |
				 s
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: Character space ]).

	self
		assert: '

' fixEmptyLinesForPango
		equals: (String streamContents: [ :s |
				 s
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: Character space ]).

	self
		assert: 'h

w' fixEmptyLinesForPango
		equals: (String streamContents: [ :s |
				 s
					 nextPut: $h;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: $w ]).

	self
		assert: 'h


w' fixEmptyLinesForPango
		equals: (String streamContents: [ :s |
				 s
					 nextPut: $h;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: $w ]).

	self
		assert: 'h



w' fixEmptyLinesForPango
		equals: (String streamContents: [ :s |
				 s
					 nextPut: $h;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: $w ]).

	self
		assert: 'h

s

w' fixEmptyLinesForPango
		equals: (String streamContents: [ :s |
				 s
					 nextPut: $h;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: $s;
					 nextPut: Character cr;
					 nextPut: Character space;
					 nextPut: Character cr;
					 nextPut: $w ])
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testLines [

	self 
		assert: ('hello
world' linesIncludeEmptySubstrings: false)
		equals: { 'hello'. 'world' }
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testReplaceAllTabsWithThreeSpaces [

	self
		assert: (String streamContents: [ :s |
				 s
					 nextPut: $h;
					 nextPut: Character tab;
					 nextPut: $w ]) replaceAllTabsWithThreeSpaces
		equals: (String streamContents: [ :s |
				 s
					 nextPut: $h;
					 nextPut: Character space;
					 nextPut: Character space;
					 nextPut: Character space;
					 nextPut: $w ])
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testTimsort [

	| array |
	self timeLimit: 5 seconds.

	array := (1 to: 1e6) asArray shuffleBy:
		         (RSRandom seed: Number firstCarmichaelNumber).

	self assert: array timsort equals: (array sorted: [ :a :b | a < b ])
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> test_g_markup_escape_text [

	self
		assert: 'hello <i>world</i>' gMarkupEscapeText
		equals: 'hello &lt;i&gt;world&lt;/i&gt;'
]
