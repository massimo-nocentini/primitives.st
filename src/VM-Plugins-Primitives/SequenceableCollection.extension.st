Extension { #name : 'SequenceableCollection' }

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> primitiveTimsort: comparer reverse: shouldReverse [

	<primitive: 'primitive_timsort' module: 'UtilsPlugin'>
	self primitiveFail
]

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> timsort: key reverse: shouldReverse [

	^ self
		  primitiveTimsort:
		  (self collect: [ :each | (key value: each) asFloat ] as: Array)
		  reverse: shouldReverse
]
