function byte = DMfunctionTest(img,k)
	coded = estraiByte( orientaDM( leggiDM( img ) ) );
	byte = char(estraiMessaggio( RSDecoder(length(coded), k , coded)) - 1);

end