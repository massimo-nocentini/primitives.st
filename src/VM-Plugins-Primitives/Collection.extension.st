Extension { #name : 'Collection' }

{ #category : '*VM-Plugins-Primitives' }
Collection >> primitiveTimsort: comparer reverse: shouldReverse [

	<primitive: 'primitive_timsort' module: 'UtilsPlugin'>
	self primitiveFail
]

{ #category : '*VM-Plugins-Primitives' }
Collection >> timsort [

	^ self timsort: [ :each | each timsortSortKey ]
]

{ #category : '*VM-Plugins-Primitives' }
Collection >> timsort: key [

	^ self timsort: key reverse: false
]

{ #category : '*VM-Plugins-Primitives' }
Collection >> timsort: key reverse: shouldReverse [

	| buffer |
	buffer := self
		          collect: [ :each |
		          Array with: each with: (key value: each) asFloat ]
		          as: Array.

	^ self primitiveTimsort: buffer reverse: shouldReverse
]

{ #category : '*VM-Plugins-Primitives' }
Collection >> weightedSample: aBlock random: random [

	| collection j w limit |
	collection := self timsort: aBlock.
	limit := aBlock value: collection last.
	j := random nextInteger: limit.

	w := collection
		     findBinaryIndex: [ :anObj |
		     j threeWayCompareTo: (aBlock value: anObj) ]
		     ifNone: [ :l | l min: collection size max: 1 ].

	^ collection at: w
]

{ #category : '*VM-Plugins-Primitives' }
Collection >> withReversedIndexDo: elementAndIndexBlock [

	| adjustedSize |
	adjustedSize := self size + 1.

	self withIndexDo: [ :each :index |
		elementAndIndexBlock value: each value: adjustedSize - index ]
]
