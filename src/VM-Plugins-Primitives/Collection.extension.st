Extension { #name : 'Collection' }

{ #category : '*VM-Plugins-Primitives' }
Collection >> withReversedIndexDo: elementAndIndexBlock [

	| selfSize |
	selfSize := self size.

	self withIndexDo: [ :each :index |
		elementAndIndexBlock value: each value: selfSize - index + 1 ]
]
