Extension { #name : 'SequenceableCollection' }

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> primitiveTimsort: comparer reverse: shouldReverse [

	<primitive: 'primitive_timsort' module: 'UtilsPlugin'>
	self primitiveFail
]

{ #category : '*VM-Plugins-Primitives' }
SequenceableCollection >> timsort: comparer reverse: shouldReverse [
	"| callback |
	callback := (FFICallback
		             signature: #( int #( int i #, int j #, void #* ud ) )
		             block: [ :i :j :externalAddress |
			             (comparer value: (self at: i) value: (self at: j))
				             asBit ]) getHandle."

	^ self primitiveTimsort: nil reverse: shouldReverse
]
