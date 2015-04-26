function msg = RSencoding( msg, n, k )
%Questa funzione effettua la codifica Reed-Solomon.
%Codifica sistematica: ridondanza + messaggio
%Input: 'msg' ? messaggio da codificare - Vector of elements in gf(2^8)
%       'k'   ? la lughezza del messaggio in input - Integer
%       'n'   ? la lunghezza del messaggio in output - Integer
%Output 'msg' ? il messaggio codificato - Vector of bits of elements in gf(2^8)

%Constructing coefficients vector of x^(n-k)
xnk=[1 0];

for i=1:n-k-1
    xnk=conv(xnk,[1 0]);
end

xnk=gf(xnk,8);

%Systematic encoding
p=get_polynomial(n-k);
[quotient,remainders]=deconv(conv(msg,xnk),p);
redundance=remainders(k+1:n);
msg=[msg,redundance];

end


function p = get_polynomial(grado)

a=gf(2,8);
p=[1 1];
for i=1:grado-1
 p=conv(p,[1 a^i]);
end

end
