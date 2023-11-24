Extension { #name : 'SequenceableCollection' }

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> primitiveTimsort: comparer reverse: shouldReverse [

	<primitive: 'primitive_timsort' module: 'UtilsPlugin'>
	self primitiveFail
]

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> timsort: comparer reverse: shouldReverse [

	| callback |
	callback := (FFICallback
		             signature: #( int #( int #, int #, void #* ) )
		             block: [ :i :j :externalAddress |
			             comparer value: (self at: i) value: (self at: j) ])
		            getHandle.

	^ self primitiveTimsort: callback reverse: shouldReverse
]
