Trait {
	#name : 'TExternalAddressHolder',
	#instVars : [
		'handle'
	],
	#category : 'VM-Plugins-Primitives',
	#package : 'VM-Plugins-Primitives'
}

{ #category : 'finalization' }
TExternalAddressHolder classSide >> deallocateHandle: anExternalAddress [

	self explicitRequirement
]

{ #category : 'finalization' }
TExternalAddressHolder classSide >> finalizeResourceData: anObject [

	self deallocateHandle: anObject.

	(anObject respondsTo: #beNull) ifTrue: [ anObject beNull ]
]

{ #category : 'adding' }
TExternalAddressHolder >> addToTheResourceManager [

	FFIExternalResourceManager addResource: self
]

{ #category : 'accessing' }
TExternalAddressHolder >> getHandle [

	^ handle
]

{ #category : 'freeing resources' }
TExternalAddressHolder >> resourceData [

	^ handle
]
