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

{ #category : 'as yet unclassified' }
TExternalAddressHolder >> allocate [

	self explicitRequirement
]

{ #category : 'as yet unclassified' }
TExternalAddressHolder >> getHandle [

	^ handle
]

{ #category : 'as yet unclassified' }
TExternalAddressHolder >> resourceData [

	^ handle
]
