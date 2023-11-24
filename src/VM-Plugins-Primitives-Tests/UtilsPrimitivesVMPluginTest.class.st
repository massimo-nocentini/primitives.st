Class {
	#name : 'UtilsPrimitivesVMPluginTest',
	#superclass : 'TestCase',
	#category : 'VM-Plugins-Primitives-Tests',
	#package : 'VM-Plugins-Primitives-Tests'
}

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
		assert: (array timsort: [ :a :b | a < b ] reverse: false)
		equals: (array sorted: [ :a :b | a < b ])
]
