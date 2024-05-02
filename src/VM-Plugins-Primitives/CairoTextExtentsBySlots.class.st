"
I provide values through slots instead of interpreting a `ByteArray`.
"
Class {
	#name : 'CairoTextExtentsBySlots',
	#superclass : 'CairoTextExtents',
	#instVars : [
		'x_bearing',
		'y_bearing',
		'width',
		'height',
		'x_advance',
		'y_advance'
	],
	#category : 'VM-Plugins-Primitives',
	#package : 'VM-Plugins-Primitives'
}

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> height [

	^ height ifNil: [ height := super height ]
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> height: anObject [

	height := anObject
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> width [

	^ width ifNil: [ width := super width ]
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> width: anObject [

	width := anObject
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> x_advance [

	^ x_advance ifNil: [ x_advance := super x_advance ]
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> x_advance: anObject [

	x_advance := anObject
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> x_bearing [

	^ x_bearing ifNil: [ x_bearing := super x_bearing ]
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> x_bearing: anObject [

	x_bearing := anObject
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> y_advance [

	^ y_advance ifNil: [ y_advance := super y_advance ]
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> y_advance: anObject [

	y_advance := anObject
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> y_bearing [

	^ y_bearing ifNil: [ y_bearing := super y_bearing ]
]

{ #category : 'accessing - structure variables' }
CairoTextExtentsBySlots >> y_bearing: anObject [

	y_bearing := anObject
]
