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
