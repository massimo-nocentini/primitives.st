Extension { #name : 'CairoScaledFont' }

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> extents [

	| extents |
	extents := CairoFontExtentsBySlots new.

	self getExtents: extents.

	^ extents
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtents: cairoFontExtents [

	^ self primitive: self getHandle getExtents: cairoFontExtents
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtentsOf: utf8String into: extentObj [

	<primitive: 'primitive_cairo_scaled_font_text_extents' module:
	'CairoGraphicsPlugin'>
	self primitiveFailed
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtentsOfGlyphs: glyphs ofLength: num into: extents [

	^ self
		  getExtentsOfHandle: self getHandle
		  ofGlyphs: glyphs
		  ofLength: num
		  into: extents
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtentsOfHandle: myHandle ofGlyphs: glyphs ofLength: num into: extents [

	<primitive: 'primitive_cairo_scaled_font_glyph_extents_bytearray' module:
	'CairoGraphicsPlugin'>
	self primitiveFail 
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> primitive: cr getExtents: cairoFontExtents [

	<primitive: 'primitive_cairo_scaled_font_extents' module:
	'CairoGraphicsPlugin'>
	self primitiveFailed
]
