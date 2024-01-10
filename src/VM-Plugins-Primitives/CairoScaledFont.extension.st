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
CairoScaledFont >> ffiGetExtentsOf: utf8String into: extentObj [
	"void                cairo_scaled_font_extents           (cairo_scaled_font_t *scaled_font,
                                                         cairo_font_extents_t *extents);
	"

	^ self ffiCall:
		  #( void cairo_scaled_font_text_extents
		     #( self #, void #* utf8String #, cairo_text_extents_t
		        #* extentObj ) )
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> ffiGetExtentsOfGlyphs: glyphs ofLength: num into: extents [
	"void
	cairo_scaled_font_glyph_extents (cairo_scaled_font_t *scaled_font,
                                 const cairo_glyph_t *glyphs,
                                 int num_glyphs,
                                 cairo_text_extents_t *extents);"
	^ self ffiCall: #(
		void cairo_scaled_font_glyph_extents (self,
                                            void *glyphs,
                                            int num,
                                            cairo_text_extents_t *extents))
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtents: cairoFontExtents [

	^ self primitive: self getHandle getExtents: cairoFontExtents
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtentsOf: utf8String into: extentObj [

	<primitive: 'primitive_cairo_scaled_font_text_extents' module:
	'CairoGraphicsPlugin'>
	^ self ffiGetExtentsOf: utf8String into: extentObj
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

	<primitive: 'primitive_cairo_scaled_font_glyph_extents_bytearray'
	module: 'CairoGraphicsPlugin'>
	^ self ffiGetExtentsOfGlyphs: glyphs ofLength: num into: extents
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> primitive: cr getExtents: cairoFontExtents [

	<primitive: 'primitive_cairo_scaled_font_extents' module:
	'CairoGraphicsPlugin'>
	^ self ffiGetExtents: cairoFontExtents
]
