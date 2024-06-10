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

	"anObject isExternalAddress beNull"
]

{ #category : 'accessing' }
TExternalAddressHolder >> getHandle [

	^ handle
]

{ #category : 'freeing resources' }
TExternalAddressHolder >> resourceData [

	^ handle
]
