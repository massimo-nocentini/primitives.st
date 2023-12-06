Extension { #name : 'CairoScaledFont' }

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> ffiGetExtents: cairoFontExtents [

	^ self ffiCall:
		  #( void cairo_scaled_font_extents #( self #, CairoFontExtents
		        #* cairoFontExtents ) )
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> getExtents: cairoFontExtents [

	^ (self
		   primitive: self getHandle
		   getExtents: cairoFontExtents getHandle) ifNil: [
		  self ffiGetExtents: cairoFontExtents ]
]

{ #category : '*VM-Plugins-Primitives' }
CairoScaledFont >> primitive: cr getExtents: cairoFontExtents [

	<primitive: 'primitive_cairo_scaled_font_extents' module:
	'CairoGraphicsPlugin'>
	^ nil
]