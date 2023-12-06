Extension { #name : 'AthensCairoCanvas' }

{ #category : '*VM-Plugins-Primitives' }
AthensCairoCanvas >> ffiTextPath: anUTF8EncodedString [

	^ self ffiCall:
		  #( void cairo_text_path #( self #, void #* anUTF8EncodedString ) )
]

{ #category : '*VM-Plugins-Primitives' }
AthensCairoCanvas >> primitive: cairoHandle textPath: anUTF8EncodedString [

	<primitive: 'primitive_cairo_text_path' module: 'CairoGraphicsPlugin'>
	^ self ffiTextPath: anUTF8EncodedString
]

{ #category : '*VM-Plugins-Primitives' }
AthensCairoCanvas >> textPath: anUTF8EncodedString [
	"A drawing operator that generates the shape from a string of UTF-8 characters, rendered according to the current font_face, font_size (font_matrix), and font_options. "

	^ self primitive: handle textPath: anUTF8EncodedString
]
