Extension { #name : 'CairoScaledFont' }

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> extents [

	| extents |
	extents := CairoFontExtentsBySlots new.

	self getExtents: extents.

	^ extents
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> ffiGetExtents: cairoFontExtents [

	^ self ffiCall:
		  #( void cairo_scaled_font_extents #( self #, CairoFontExtents
		        #* cairoFontExtents ) )
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtents: cairoFontExtents [

	^ (self primitive: self getHandle getExtents: cairoFontExtents)
		  ifNil: [ self ffiGetExtents: cairoFontExtents ]
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtentsOf: utf8String into: extentObj [

	<primitive: 'primitive_cairo_scaled_font_text_extents' module:
	'CairoGraphicsPlugin'>
	
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

	<primitive: 'primitive_cairo_scaled_font_glyph_extents' module:
	'CairoGraphicsPlugin'>
	
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> primitive: cr getExtents: cairoFontExtents [

	<primitive: 'primitive_cairo_scaled_font_extents' module:
	'CairoGraphicsPlugin'>
	^ nil
]
