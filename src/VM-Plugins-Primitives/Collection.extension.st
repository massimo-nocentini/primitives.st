Extension { #name : 'Collection' }

{ #category : '*VM-Plugins-Primitives' }
Collection >> withReversedIndexDo: elementAndIndexBlock [

	| adjustedSize |
	adjustedSize := self size + 1.

	self withIndexDo: [ :each :index |
		elementAndIndexBlock value: each value: adjustedSize - index ]
]
