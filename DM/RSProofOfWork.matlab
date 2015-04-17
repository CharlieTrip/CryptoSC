n = 12; % Codeword length
k = 5; % and message length
m = 8; % Number of bits in each symbol
msg = [98 99 100 101 129]; % Message is a Galois array.
obj = comm.RSEncoder(n, k);
release(obj)
obj.PrimitivePolynomialSource = 'Property';
obj.PrimitivePolynomial = fliplr(de2bi(301,9));

obj.GeneratorPolynomialSource = 'Property';

obj.GeneratorPolynomial = rsgenpoly(255,248,301);


c1 = step(obj, msg');
c = [c1 ].'
