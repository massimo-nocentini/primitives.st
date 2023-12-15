Extension { #name : 'CairoFontMetricsProvider' }

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> convertString: utf8String len: strlen ofFont: aScaledFont toGlyphs: glyphs numGlyphs: numGlyphs x: x y: y [

	<primitive: 'primitive_cairo_scaled_font_text_to_glyphs' module:
	'CairoGraphicsPlugin'>
	^ self
		  ffiConvertString: utf8String
		  len: strlen
		  ofFont: aScaledFont
		  toGlyphs: glyphs
		  numGlyphs: numGlyphs
		  x: x
		  y: y
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> extentsOf: aString [

	| glyphs |
	glyphs := self glyphsOf: aString.
	self getExtentsOfGlyphs: glyphs getHandle ofLength: glyphs size.
	^ glyphExtents
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> ffiConvertString: utf8String len: strlen ofFont: aScaledFont toGlyphs: glyphs numGlyphs: numGlyphs x: x y: y [
"
all of this for using
http://www.cairographics.org/manual/cairo-User-Fonts.html#cairo-user-scaled-font-text-to-glyphs-func-t

"
	^ self ffiCall: #(
		cairo_status_t cairo_scaled_font_text_to_glyphs (void * aScaledFont,
			double x,
			double y,
			void * utf8String,
			int strlen,
			void ** glyphs,
			int * numGlyphs,
			NULL,
			NULL,
			NULL))
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> ffiFreeGlyphs: glyphs [

	^ self ffiCall: #( void cairo_glyph_free #( void #* glyphs ) )
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> freeGlyphs: glyphs [

	<primitive: 'primitive_cairo_glyph_free' module:
	'CairoGraphicsPlugin'>
	^ self ffiFreeGlyphs: glyphs
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> getExtentsFont: fontHandle glyphs: glyphs length: num into: into [

	<primitive: 'primitive_cairo_scaled_font_glyph_extents' module:
	'CairoGraphicsPlugin'>
	^ nil
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> getExtentsOfGlyphs: ptr ofLength: glyphsSize [

	(self
		 getExtentsFont: cairoFont getHandle
		 glyphs: ptr
		 length: glyphsSize
		 into: glyphExtents getHandle) ifNil: [
		cairoFont
			getExtentsOfGlyphs: ptr
			ofLength: glyphsSize
			into: glyphExtents ]
]

{ #category : '*VM-Plugins-Primitives' }
CairoFontMetricsProvider >> glyphsOf: aString from: start to: end [

	| len ptr glyphs lenValue glyphsSize utf8Len error |
	len := end - start + 1.
	utf8Len := utfConverter convert: aString from: start to: end.

	ptr := ExternalAddress new.
	lenValue := ByteArray new: 4.

	error := self
		         convertString: utfConverter buffer
		         len: utf8Len
		         ofFont: cairoFont getHandle
		         toGlyphs: ptr
		         numGlyphs: lenValue
		         x: 0.0
		         y: 0.0.

	error = CAIRO_STATUS_SUCCESS ifFalse: [ ^ CairoGlyphsArray new: 0 ].

	glyphsSize := lenValue unsignedLongAt: 1.

	self getExtentsOfGlyphs: ptr ofLength: glyphsSize.

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
CairoFontMetricsProvider >> memCopy: src to: dest size: n [

	<primitive: 'primitive_cairo_memcpy_glyphs' module:
	'CairoGraphicsPlugin'>
	^ LibC memCopy: src to: dest size: n
]
