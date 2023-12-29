Extension { #name : 'CairoFontMetricsProvider' }

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> convertString: utf8String len: strlen ofFont: aScaledFont toGlyphs: glyphs numGlyphs: numGlyphs x: x y: y [

	<primitive: 'primitive_cairo_scaled_font_text_to_glyphs' module:
	'CairoGraphicsPlugin'>
	self primitiveFailed
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> extentsOf: aString [

	| glyphs |
	glyphs := self glyphsOf: aString.
	self getExtentsOfGlyphs: glyphs getHandle ofLength: glyphs size.
	^ glyphExtents
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> freeGlyphs: glyphs [

	<primitive: 'primitive_cairo_glyph_free' module:
	'CairoGraphicsPlugin'>
	self primitiveFailed
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> getExtentsFont: fontHandle glyphs: glyphs length: num into: into [

	<primitive: 'primitive_cairo_scaled_font_glyph_extents' module:
	'CairoGraphicsPlugin'>
	self primitiveFailed 
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> getExtentsOfGlyphs: ptr ofLength: glyphsSize [

	^ self
		  getExtentsFont: cairoFont getHandle
		  glyphs: ptr
		  length: glyphsSize
		  into: glyphExtents
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> getGlyphWidth: aCharacter [

	cairoFont getExtentsOf: aCharacter asUTF8ByteArray into: glyphExtents.
	^ glyphExtents x_advance
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> glyphsOf: aString from: start to: end [

	| ptr glyphs lenValue glyphsSize error utf8string |
	utf8string := aString asUTF8ByteArray.

	ptr := ExternalAddress new.
	lenValue := ByteArray new: 4.

	error := self
		         convertString: utf8string
		         len: utf8string size
		         ofFont: cairoFont getHandle
		         toGlyphs: ptr
		         numGlyphs: lenValue
		         x: 0.0
		         y: 0.0.

	error = CAIRO_STATUS_SUCCESS ifFalse: [ ^ CairoGlyphsArray new: 0 ].

	glyphsSize := lenValue unsignedLongAt: 1.

	"self getExtentsOfGlyphs: ptr ofLength: glyphsSize."

	glyphs := CairoGlyphsArray new: glyphsSize.

	self
		memCopy: ptr
		to: glyphs getHandle
		size: glyphsSize * glyphs typeSize.

	"Apply kerning on glyphs if font supports it"
	font face hasKerning ifTrue: [
		self
			applyKerningOn: glyphs
			of: aString
			from: start
			to: end ].

	self freeGlyphs: ptr.

	^ glyphs
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> initialize [
	"utfConverter := CairoUTF8Converter new."
	glyphExtents := CairoTextExtentsBySlots new.
	cache := CairoBackendCache soleInstance
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> memCopy: src to: dest size: n [

	<primitive: 'primitive_cairo_memcpy_glyphs' module:
	'CairoGraphicsPlugin'>
	self primitiveFailed
]
