Extension { #name : 'SequenceableCollection' }

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> primitiveTimsort: comparer reverse: shouldReverse [

	<primitive: 'primitive_timsort' module: 'UtilsPlugin'>
	self primitiveFail
]

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> timsort [

	^ self timsort: #yourself
]

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> timsort: key [

	^ self timsort: key reverse: false
]

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> timsort: key reverse: shouldReverse [

	| buffer |
	buffer := self
		          collect: [ :each |
		          Array with: each with: (key value: each) asFloat ]
		          as: Array.

	^ self primitiveTimsort: buffer reverse: shouldReverse
]
