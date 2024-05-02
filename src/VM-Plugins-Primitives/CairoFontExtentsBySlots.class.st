"
I provide values through slots instead of interpreting a `ByteArray`.
"
Class {
	#name : 'CairoFontExtentsBySlots',
	#superclass : 'CairoFontExtents',
	#instVars : [
		'ascent',
		'descent',
		'width',
		'height',
		'max_x_advance',
		'max_y_advance'
	],
	#category : 'VM-Plugins-Primitives',
	#package : 'VM-Plugins-Primitives'
}

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> ascent [

	^ ascent ifNil: [ ascent := super ascent ]
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> ascent: anObject [

	ascent := anObject
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> descent [

	^ descent ifNil: [ descent := super descent ]
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> descent: anObject [

	descent := anObject
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> height [

	^ height ifNil: [ height := super height ]
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> height: anObject [

	height := anObject
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> max_x_advance [

	^ max_x_advance ifNil: [ max_x_advance := super max_x_advance ]
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> max_x_advance: anObject [

	max_x_advance := anObject
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> max_y_advance [

	^ max_y_advance ifNil: [ max_y_advance := super max_y_advance ]
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> max_y_advance: anObject [

	max_y_advance := anObject
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> width [

	^ width ifNil: [ width := super width ]
]

{ #category : 'accessing - structure variables' }
CairoFontExtentsBySlots >> width: anObject [

	width := anObject
]
