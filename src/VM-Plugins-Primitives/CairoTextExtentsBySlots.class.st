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

{ #category : 'accessing' }
CairoTextExtentsBySlots >> height [

	^ height
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> height: anObject [

	height := anObject
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> width [

	^ width
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> width: anObject [

	width := anObject
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> x_advance [

	^ x_advance
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> x_advance: anObject [

	x_advance := anObject
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> x_bearing [

	^ x_bearing
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> x_bearing: anObject [

	x_bearing := anObject
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> y_advance [

	^ y_advance
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> y_advance: anObject [

	y_advance := anObject
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> y_bearing [

	^ y_bearing
]

{ #category : 'accessing' }
CairoTextExtentsBySlots >> y_bearing: anObject [

	y_bearing := anObject
]
