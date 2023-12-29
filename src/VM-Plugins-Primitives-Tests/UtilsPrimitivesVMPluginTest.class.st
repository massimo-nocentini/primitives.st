Class {
	#name : 'UtilsPrimitivesVMPluginTest',
	#superclass : 'TestCase',
	#category : 'VM-Plugins-Primitives-Tests',
	#package : 'VM-Plugins-Primitives-Tests'
}

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testAsUTF8ByteArray_Character [

	self
		assert: 223 asCharacter asUTF8ByteArray equals: #[ 195 159 0 ];
		assert: $a asUTF8ByteArray equals: #[ 97 0 ]
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testAsUTF8ByteArray_String [

	self assert: 'abc' asUTF8ByteArray equals: #[ 97 98 99 ].

	self
		assert: 223 asCharacter asString asUTF8ByteArray
		equals: #[ 195 159 ]
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testLines [

	self 
		assert: ('hello
world' linesIncludeEmptySubstrings: false)
		equals: { 'hello'. 'world' }
]

{ #category : 'tests' }
UtilsPrimitivesVMPluginTest >> testTimsort [

	| array |
	self timeLimit: 5 seconds.

	array := (1 to: 1e6) shuffled.

	self
		assert: (array timsort: #yourself reverse: false)
		equals: (array sorted: [ :a :b | a < b ])
]
