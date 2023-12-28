Extension { #name : 'CairoFreetypeFontRenderer' }

{ #category : '*VM-Plugins-Primitives' }
CairoFreetypeFontRenderer >> initialize [
	utfConverter := CairoUTF8Converter new.
	advance := 0@0.
	glyphExtents := CairoTextExtentsBySlots new
]
