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
TExternalAddressHolder classSide >> finalizeResourceData: anExternalAddress [

	self deallocateHandle: anExternalAddress.

	anExternalAddress beNull
]

{ #category : 'accessing' }
TExternalAddressHolder >> getHandle [

	^ handle
]

{ #category : 'freeing resources' }
TExternalAddressHolder >> resourceData [

	^ handle
]
