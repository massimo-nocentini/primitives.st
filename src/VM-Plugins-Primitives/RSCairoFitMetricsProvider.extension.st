Extension { #name : 'RSCairoFitMetricsProvider' }

{ #category : '*VM-Plugins-Primitives' }
RSCairoFitMetricsProvider >> extentsOf: aRSLabel [
	| rawExt cairoFont glyphs |
	cairoFont := aRSLabel cairoFont.
	glyphs := aRSLabel cairoGlyphs.
	rawExt := CairoTextExtentsBySlots new.
	cairoFont getExtentsOfGlyphs: glyphs getHandle ofLength: glyphs size into: rawExt.
	^ RSTextExtents new
		from: rawExt;
		yourself
]
