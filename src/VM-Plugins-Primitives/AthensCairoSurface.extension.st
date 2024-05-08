Extension { #name : 'AthensCairoSurface' }

{ #category : '*VM-Plugins-Primitives' }
AthensCairoSurface class >> primWidth: aWidth height: aHeight [
	^ self ffiCall: #( AthensCairoSurface cairo_image_surface_create (
						int CAIRO_FORMAT_ARGB32,
						int aWidth,
						int aHeight) )
]
